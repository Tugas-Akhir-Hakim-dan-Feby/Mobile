// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sp_util/sp_util.dart';
// import 'package:http/http.dart' as http;

// class FetchProfileWidget extends StatefulWidget {
//   @override
//   _FetchProfileWidgetState createState() => _FetchProfileWidgetState();

//   Future<String?> fetchProfile() async {
//     _FetchProfileWidgetState state = _FetchProfileWidgetState();
//     await state._fetchProfile();
//     return state.documentPath;
//   }
// }

// class _FetchProfileWidgetState extends State<FetchProfileWidget> {
//   late String membershipCard;
//   late String documentPath;
  

//   @override
//   void initState() {
//     super.initState();
//     _fetchProfile();
//   }

//   Future<void> _fetchProfile() async {
//     String? token = SpUtil.getString('token');

//     if (token == null) {
//       throw Exception('Token tidak ditemukan');
//     }

//     final headers = {
//       'Authorization': 'Bearer $token',
//     };

//     final response = await http.get(
//       Uri.parse('https://develop-ta.berobatplus.shop/api/v1/user/me'),
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);
//       final document = jsonResponse['document'];
//       final documentPath = document['document_path'];
//       SpUtil.putString("save_image", documentPath);
//       print(documentPath);
//       print("hiii");
//       setState(() {
//         this.documentPath = documentPath;
//       });
//     } else {
//       throw Exception('Gagal memuat data Foto');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           documentPath,
//           style: GoogleFonts.poppins(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }
// }
