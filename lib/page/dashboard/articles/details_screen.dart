// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:http/http.dart' as http;
// import 'package:sp_util/sp_util.dart';

// class DetailsScreen extends StatefulWidget {
//   final String uuid;

//   const DetailsScreen({Key? key, required this.uuid}) : super(key: key);

//   @override
//   _DetailsScreenState createState() => _DetailsScreenState();
// }

// class _DetailsScreenState extends State<DetailsScreen> {
//   late Future<DetailArticle> _getDataFuture;

//   @override
//   void initState() {
//     super.initState();
//     _getDataFuture = fetchData();
//   }

//   Future<DetailArticle> fetchData() async {
//     final token = SpUtil.getString('token');
//     final response = await http.get(
//       Uri.parse(
//           'https://develop-ta.berobatplus.shop/api/v1/article/${widget.uuid}'),
//       headers: {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );
//     if (response.statusCode == 200) {
//       print("ok masuk");
//       print(response.body);
//       final jsonData = json.decode(response.body);
//       return DetailArticle.fromJson(jsonData);
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: FutureBuilder<DetailArticle>(
//         future: _getDataFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final data = snapshot.data!.data;
//             final String imageUrl = data.document.documentPath;
//             final String title = data.articleTitle;
//             final String description = data.articleContent;
//             final String authors = data.user.name;

//             return ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 Image.network(
//                   imageUrl,
//                   height: 300,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 Transform.translate(
//                   offset: const Offset(0, -20),
//                   child: Container(
//                     padding: const EdgeInsets.all(25),
//                     margin: const EdgeInsets.only(bottom: 100),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(20),
//                         topLeft: Radius.circular(20),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     title,
//                                     style:
//                                         Theme.of(context).textTheme.headline6,
//                                     overflow: TextOverflow.fade,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Icon(Icons.location_pin,
//                                 color: Theme.of(context).primaryColor,
//                                 size: 20),
//                             const SizedBox(width: 5),
//                             Text('Indramyu',
//                                 style: TextStyle(
//                                     color: Theme.of(context).primaryColor))
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
// // Icon( Icons.assignment_ind ,
//                             Icon(Icons.switch_account,
//                                 color: Theme.of(context).primaryColor,
//                                 size: 20),
//                             const SizedBox(width: 5),
//                             Text(authors,
//                                 style: TextStyle(
//                                     color: Theme.of(context).primaryColor))
//                           ],
//                         ),
//                         const SizedBox(height: 25),
//                         Text(
//                           'Deskripsi',
//                           style: Theme.of(context).textTheme.headline6,
//                         ),
//                         // const SizedBox(height: 0),
//                         Html(
//                           data: description,
//                           style: {
//                             'html': Style(
//                               fontSize: FontSize(16),
//                               // lineHeight: LineHeight(1.5),
//                               textAlign: TextAlign.justify,
//                             ),
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }
//         },
//       ),
//       bottomSheet: Container(
//         padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
//         width: double.infinity,
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           style: ElevatedButton.styleFrom(
//             padding: const EdgeInsets.all(15),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: const Text('Kembali'),
//         ),
//       ),
//     );
//   }
// }

// class DetailArticle {
//   String status;
//   String message;
//   int?
//       statusCode; // Tambahkan tanda tanya (?) untuk mengindikasikan bahwa nilai dapat null
//   Data data;

//   DetailArticle({
//     required this.status,
//     required this.message,
//     this.statusCode, // Ubah menjadi nullable dengan tanda tanya (?)
//     required this.data,
//   });

//   factory DetailArticle.fromJson(Map<String, dynamic> json) {
//     return DetailArticle(
//       status: json['status'],
//       message: json['message'],
//       statusCode: json['status_code']
//           as int?, // Tambahkan as int? untuk mengizinkan nilai null
//       data: Data.fromJson(json['data']),
//     );
//   }
// }

// class Data {
//   String uuid;
//   String articleTitle;
//   String articleSlug;
//   String articleContent;
//   int status;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Document document;
//   User user;

//   Data({
//     required this.uuid,
//     required this.articleTitle,
//     required this.articleSlug,
//     required this.articleContent,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.document,
//     required this.user,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       uuid: json['uuid'],
//       articleTitle: json['article_title'],
//       articleSlug: json['article_slug'],
//       articleContent: json['article_content'],
//       status: json['status'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       document: Document.fromJson(json['document']),
//       user: User.fromJson(json['user']),
//     );
//   }
// }

// class Document {
//   String documentPath;
//   String documentName;
//   DateTime createdAt;
//   DateTime updatedAt;

//   Document({
//     required this.documentPath,
//     required this.documentName,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Document.fromJson(Map<String, dynamic> json) {
//     return Document(
//       documentPath: json['document_path'],
//       documentName: json['document_name'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }

// class User {
//   String uuid;
//   String name;
//   String email;
//   int roleId;
//   DateTime createdAt;
//   DateTime updatedAt;

//   User({
//     required this.uuid,
//     required this.name,
//     required this.email,
//     required this.roleId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       uuid: json['uuid'],
//       name: json['name'],
//       email: json['email'],
//       roleId: json['role_id'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:api_mobile/model/articles.dart';

class DetailsScreen extends StatelessWidget {
  final Data article;

  DetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.network(
            article.document?.documentPath ?? '',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.only(bottom: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.articleTitle ?? '',
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.location_pin,
                          color: Theme.of(context).primaryColor, size: 20),
                      const SizedBox(width: 5),
                      Text('Indramyu',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.switch_account,
                          color: Theme.of(context).primaryColor, size: 20),
                      const SizedBox(width: 5),
                      Text('Author: ${article.user?.name ?? ''}',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor))
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Deskripsi',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Html(
                    data: article.articleContent ?? '',
                    style: {
                      'html': Style(
                        fontSize: FontSize(16),
                        textAlign: TextAlign.justify,
                      ),
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Kembali'),
        ),
      ),
    );
  }
}
