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

class FormMemberCompany extends StatefulWidget {
  const FormMemberCompany({Key? key}) : super(key: key);

  @override
  State<FormMemberCompany> createState() => _FormMemberCompanyState();
}

class _FormMemberCompanyState extends State<FormMemberCompany> {
  TextEditingController txtCompanyName = TextEditingController();
  TextEditingController txtCompanyDirector = TextEditingController();
  TextEditingController txtCompanyAddress = TextEditingController();
  TextEditingController txtCompanyProfile = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtFacsmile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtCompanyLegality = TextEditingController();
  TextEditingController txtDocumentCertificateCompetency =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isEmployed = false;
  DateTime? _selectedDate;
  List<Datum> skillData = [];
  Datum? selectedSkill;

  File? _selectedCompanyLegality;
  File? _selecteddocumentCompanyLogo;

  @override
  void initState() {
    super.initState();
    // fetchSkillData();
  }

  // Future<void> fetchSkillData() async {
  //   final token = SpUtil.getString('token');
  //   final response = await http.get(
  //     Uri.parse('https://develop-ta.berobatplus.shop/api/v1/skill/welder'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     final memberSkill = memberSkillFromJson(response.body);
  //     setState(() {
  //       skillData = memberSkill.data;
  //     });
  //   } else {
  //     throw Exception('Failed to fetch skill data');
  //   }
  // }

  Future<void> _selectedLegality() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedCompanyLegality = File(pickedImage.path);
        txtCompanyLegality.text = pickedImage.path; // Update text field value
      });
    }
  }

  Future<void> _selectImageCertificate() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selecteddocumentCompanyLogo = File(pickedImage.path);
        txtDocumentCertificateCompetency.text =
            pickedImage.path; // Update text field value
      });
    }
  }

  Future<void> _doRegisterMember() async {
    final token = SpUtil.getString('token');

    String companyName = txtCompanyName.text;
    String companyDirector = txtCompanyDirector.text;
    String companyAddress = txtCompanyAddress.text;
    String companyProfile = txtCompanyProfile.text;
    String phone = txtPhone.text;
    String facsmile = txtFacsmile.text;
    String email = txtEmail.text;

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
      Uri.parse('${AppConfig.getUrl()}user/company-member'),
    );
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';

    request.fields['company_name'] = companyName;
    request.fields['company_director'] = companyDirector;
    request.fields['company_address'] = companyAddress;
    request.fields['company_profile'] = companyProfile;
    request.fields['phone'] = phone;
    request.fields['facsmile'] = facsmile;
    request.fields['company_email'] = email;

    if (_selectedCompanyLegality != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'document_company_legality',
        _selectedCompanyLegality!.path,
      ));
    }

    if (_selecteddocumentCompanyLogo != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'document_company_logo',
        _selecteddocumentCompanyLogo!.path,
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
        title: const Text('Formulir Company API'),
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
                      controller: txtCompanyName,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Nama Perusahaan Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.business ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Perusahaan Tidak Boleh Kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtCompanyDirector,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Nama Direktur Perusahaan Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.account_box_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Direktur Perusahaan Tidak Boleh Kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtCompanyAddress,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Alamat Perusahaan Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.add_location_alt_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat Tidak Boleh Kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtEmail,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Alamat Email Perusahaan Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Tidak Boleh Kosong.';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Masukan Email yang Valid";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtCompanyProfile,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Profil Perusahaan Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.chrome_reader_mode_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Profil Tidak Boleh Kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtPhone,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Nomor Telephone Perusahaan Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor Telephone Tidak Boleh Kosong.';
                        }
                        if (!RegExp(r'^[\d+]+$').hasMatch(value)) {
                          return 'Nomor Telephone berupa angka  saja.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: txtFacsmile,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Fax Perusahaan Anda',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.fax),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Fax Tidak Boleh Kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      readOnly: true,
                      onTap: _selectedLegality,
                      decoration: InputDecoration(
                        labelText: 'Unggah Foto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.image),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.file_upload),
                          onPressed: _selectedLegality,
                        ),
                      ),
                      controller: txtCompanyLegality,
                      validator: (value) {
                        if (_selectedCompanyLegality == null) {
                          return 'Image must be selected.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    if (_selectedCompanyLegality != null)
                      Container(
                        height: 400,
                        child: Image.file(_selectedCompanyLegality!),
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
                        if (_selecteddocumentCompanyLogo == null) {
                          return 'Certificate must be selected.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    if (_selecteddocumentCompanyLogo != null)
                      Container(
                        height: 400,
                        child: Image.file(_selecteddocumentCompanyLogo!),
                      ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _doRegisterMember();
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
