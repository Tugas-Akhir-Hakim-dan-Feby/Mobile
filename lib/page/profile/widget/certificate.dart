import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  _CertificateScreenState createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  List<String> certificates = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final token = SpUtil.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan');
    }

    final headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.parse('https://develop-ta.berobatplus.shop/api/v1/user/me'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var user = jsonData['user'];
      var welderDocuments = user['welder_documents'];

      List<String> fetchedCertificates = [];

      for (var document in welderDocuments) {
        var certificatePath = document['document_path'];
        fetchedCertificates.add(certificatePath);
      }

      setState(() {
        certificates = fetchedCertificates;
      });
    } else {
      // Error handling
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> downloadImage(String imageUrl) async {
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    // Tambahkan logika penyimpanan file sesuai kebutuhan Anda.
    // Misalnya, menggunakan package path_provider untuk menyimpan di direktori tertentu.
    // File dapat diakses melalui file.path.
    print('File downloaded: ${file.path}');
  }

  void viewImageFullScreen(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.download),
                onPressed: () {
                  downloadImage(imageUrl);
                },
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Image.network(imageUrl),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificate'),
      ),
      body: certificates.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListWheelScrollView(
              itemExtent: 300,
              children: certificates.map((certificatePath) {
                return GestureDetector(
                  onTap: () {
                    viewImageFullScreen(certificatePath);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(certificatePath),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
