import 'dart:convert';
import 'dart:io';

import 'package:api_mobile/components/theme/colors.dart';
import 'package:api_mobile/connection/app_config.dart';
import 'package:api_mobile/model/member_skill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sp_util/sp_util.dart';

class FormMemberWelder extends StatefulWidget {
  const FormMemberWelder({Key? key}) : super(key: key);

  @override
  State<FormMemberWelder> createState() => _FormMemberWelderState();
}

class _FormMemberWelderState extends State<FormMemberWelder> {
  TextEditingController txtWelderSkillId = TextEditingController();
  TextEditingController txtResidentIdCard = TextEditingController();
  TextEditingController txtDateBirth = TextEditingController();
  TextEditingController txtBirthPlace = TextEditingController();
  TextEditingController txtWorkingStatus = TextEditingController();
  TextEditingController txtDocumentPasPhoto = TextEditingController();
  TextEditingController txtDocumentCertificateCompetency =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isEmployed = false;
  String? _selectedCompetency;
  DateTime? _selectedDate;
  List<Datum> skillData = [];
  Datum? selectedSkill;

  File? _selectedPhotouser;
  File? _selectedCertificate;

  @override
  void initState() {
    super.initState();
    fetchSkillData();
  }

  Future<void> fetchSkillData() async {
    final token = SpUtil.getString('token');
    final response = await http.get(
       Uri.parse('${AppConfig.getUrl()}skill/welder'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    
    if (response.statusCode == 200) {
      final memberSkill = memberSkillFromJson(response.body);
      setState(() {
        skillData = memberSkill.data;
      });
    } else {
      throw Exception('Failed to fetch skill data');
    }
  }

  Future<void> _selectImageUser() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedPhotouser = File(pickedImage.path);
        txtDocumentPasPhoto.text = pickedImage.path; // Update text field value
      });
    }
  }

  Future<void> _selectImageCertificate() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedCertificate = File(pickedImage.path);
        txtDocumentCertificateCompetency.text =
            pickedImage.path; // Update text field value
      });
    }
  }

  Future<void> _doRegisterMemberWelder() async {
    final token = SpUtil.getString('token');
    String skill = selectedSkill?.uuid ?? '';
    String nik = txtResidentIdCard.text;
    String birt = txtDateBirth.text;
    String birthPlace = txtBirthPlace.text;
    String statusWorking = txtWorkingStatus.text;

    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(
      msg: "Memuat......",
      progressBgColor: const Color.fromARGB(0, 174, 155, 155),
      max: 100,
      barrierDismissible: true,
      hideValue: true,
      completed: Completed(),
    );

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppConfig.getUrl()}user/welder-member'),
    );
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';

    // request.fields['welder_skill_id'] = selectedSkill?.uuid ?? '';
    request.fields['welder_skill_id'] = skill;
    request.fields['resident_id_card'] = nik;
    request.fields['date_birth'] = birt;
    request.fields['birth_place'] = birthPlace;
    request.fields['working_status'] = statusWorking;

    if (_selectedPhotouser != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'document_pas_photo',
        _selectedPhotouser!.path,
      ));
    }

    if (_selectedCertificate != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'document_certificate_competency',
        _selectedCertificate!.path,
      ));
    }

    var response = await request.send();
    int statusCode = response.statusCode;

    if (response.statusCode == 201) {
      print('Status Code: $statusCode');
      Alert(
        context: context,
        title: "Data Berhasil dibuat",
        type: AlertType.success,
        buttons: [
          DialogButton(
            child: Text(
              "Lanjutkan",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Get.offNamedUntil('/payment_history', (route) => false);
            },
            color: Colors.green,
          ),
        ],
      ).show().then((value) {
        Get.offNamedUntil('/payment_history', (route) => false);
      });
      print('Success: Registered successfully');
    } else if (response.statusCode == 422) {
      print('Status Code: $statusCode');
      String errorMessage = "Unknown error occurred.";
      if (response.headers.containsKey('error-messages')) {
        String errorMessages = response.headers['error-messages']!;
        Map<String, dynamic> errors = jsonDecode(errorMessages);
        if (errors.containsKey('welder_skill_id')) {
          errorMessage = errors['welder_skill_id'][0];
        }
      }

      String responseBody = await response.stream.bytesToString();

      print('Error Message: $errorMessage');
      print('Response Body: $responseBody');

      print('Status Code: $statusCode');
      Alert(
        context: context,
        title: "Ada Kesalahan di Jawaban",
        desc: "periksa kembali jawaban Anda",
        type: AlertType.warning,
        buttons: [
          DialogButton(
            child: const Text(
              "Kembali",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          )
        ],
      ).show();
      // print('Error: Unprocessable Entity');
    } else {
      print('Status Code: $statusCode');
      Alert(
        context: context,
        title: "Tanggapan Lainnya",
        desc: "Status code yang tidak terduga: $statusCode",
        type: AlertType.error,
        buttons: [
          DialogButton(
            child: const Text(
              "Tutup",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          )
        ],
      ).show();
      print('Error: Unexpected status code $statusCode');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Formulir Welder API'),
        backgroundColor: maincolor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: txtResidentIdCard,
                      decoration: InputDecoration(
                        labelText: 'Masukkan NIK Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.account_box_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'NIK Tidak Boleh Kosong.';
                        }
                        if (value.length < 16) {
                          return 'NIK Kurang  ${16 - value.length} angka lagi.';
                        }
                        if (value.length > 16) {
                          return 'NIK Lebih ${value.length - 16} angka.';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'NIK hanya boleh mengandung angka.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtBirthPlace,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Tempat Lahir Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.add_location_alt_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tempat Lahir Tidak Boleh Kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtDateBirth,
                      decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.calendar_month),
                      ),
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ).then((dateValue) {
                          if (dateValue != null) {
                            setState(() {
                              _selectedDate = DateTime(
                                dateValue.year,
                                dateValue.month,
                                dateValue.day,
                              );
                              txtDateBirth.text =
                                  '${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}';
                            });
                          }
                        });
                      },
                      validator: (value) {
                        if (_selectedDate == null) {
                          return 'Tanggal Lahir tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    DropdownButtonFormField<Datum>(
                      decoration: InputDecoration(
                        labelText: 'Select Competency',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.work),
                      ),
                      value: selectedSkill,
                      hint: Text('Pilih Skill'),
                      onChanged: (newValue) {
                        setState(() {
                          selectedSkill = newValue;
                        });
                      },
                      items:
                          skillData.map<DropdownMenuItem<Datum>>((Datum value) {
                        return DropdownMenuItem<Datum>(
                          value: value,
                          child: Text(value
                              .skillName), // Menampilkan nama skill sebagai teks
                        );
                      }).toList(),
                      isExpanded: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Keahlian harus dipilih';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('Status Bekerja: '),
                        Checkbox(
                          value: _isEmployed,
                          onChanged: (value) {
                            setState(() {
                              _isEmployed = value!;
                              txtWorkingStatus.text = _isEmployed ? '1' : '0';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      readOnly: true,
                      onTap: _selectImageUser,
                      decoration: InputDecoration(
                        labelText: 'Unggah Foto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.image),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.file_upload),
                          onPressed: _selectImageUser,
                        ),
                      ),
                      controller: txtDocumentPasPhoto,
                      validator: (value) {
                        if (_selectedPhotouser == null) {
                          return 'Pas foto tidak boleh kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    if (_selectedPhotouser != null)
                      Container(
                        height: 400,
                        child: Image.file(_selectedPhotouser!),
                      ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      readOnly: true,
                      onTap: _selectImageCertificate,
                      decoration: InputDecoration(
                        labelText: 'Unggah Sertifikat',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.image),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.file_upload),
                          onPressed: _selectImageCertificate,
                        ),
                      ),
                      controller: txtDocumentCertificateCompetency,
                      validator: (value) {
                        if (_selectedCertificate == null) {
                          return 'sertifikat keahlian tidak boleh kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    if (_selectedCertificate != null)
                      Container(
                        height: 400,
                        child: Image.file(_selectedCertificate!),
                      ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _doRegisterMemberWelder();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 73, 230, 76),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
