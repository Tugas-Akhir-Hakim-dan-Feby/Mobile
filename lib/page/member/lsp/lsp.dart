import 'dart:convert';
import 'package:api_mobile/components/theme/colors.dart';
import 'package:api_mobile/model/articles.dart';
import 'package:api_mobile/page/member/job_vacancy/details_job_vacancy.dart';
import 'package:api_mobile/page/member/lsp/details_lsp.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:intl/intl.dart';

class InstitutionOfProfessionalCertification extends StatefulWidget {
  const InstitutionOfProfessionalCertification({Key? key}) : super(key: key);

  @override
  _InstitutionOfProfessionalCertificationState createState() => _InstitutionOfProfessionalCertificationState();
}

class _InstitutionOfProfessionalCertificationState extends State<InstitutionOfProfessionalCertification> {
  late Future<Article> articleData;

  @override
  void initState() {
    super.initState();
    articleData = fetchArticleData();
  }

  Future<Article> fetchArticleData() async {
    final token = SpUtil.getString('token');
    try {
      final response = await http.get(
        Uri.parse('https://develop-ta.berobatplus.shop/api/v1/article'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return Article.fromJson(json.decode(response.body));
      } else {
        throw Exception(
            'Failed to load articles. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load articles: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Text('Mitra Lembaga Sertifikasi'),
      ),
      body: FutureBuilder<Article>(
        future: articleData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasData) {
            return GroupedListView<Data, String>(
              elements: snapshot.data!.data!,
              groupBy: (item) => item.articleTitle ?? '',
              groupSeparatorBuilder: (groupValue) => Padding(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              itemBuilder: (context, item) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsInstitutionOfProfessionalCertification(item),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 145,
                            height: 110,
                            child: ClipRRect(
                              child: Image(
                                image: NetworkImage(
                                    item.document!.documentPath ?? ''),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      item.articleTitle ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow
                                          .visible, // Mengganti overflow menjadi TextOverflow.visible
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.account_circle_sharp,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            '${item.user!.name ?? ''}',
                                            overflow: TextOverflow
                                                .visible, // Mengganti overflow menjadi TextOverflow.visible
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            formatDate(item.createdAt ?? ''),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ); 
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

String formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  DateFormat formatter = DateFormat('dd MMMM yyyy');
  return formatter.format(parsedDate);
}
