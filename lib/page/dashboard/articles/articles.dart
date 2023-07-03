import 'dart:async';
import 'dart:convert';

import 'package:api_mobile/model/articles.dart';
import 'package:api_mobile/page/dashboard/articles/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;

class Articles extends StatefulWidget {
  final String searchQuery;

  Articles(this.searchQuery);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final StreamController<Article> _streamController = StreamController<Article>();

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void fetchArticles() async {
    final token = SpUtil.getString('token');
    try {
      final response = await http.get(
        Uri.parse(
          'https://develop-ta.berobatplus.shop/api/v1/article?search=${widget.searchQuery}',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        _streamController.add(Article.fromJson(json.decode(response.body)));
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
    return StreamBuilder<Article>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        color: Theme.of(context)
                            .primaryColor
                            .withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        } else if (snapshot.hasData) {
          final articles = snapshot.data!.data;
          if (articles!.isEmpty) {
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(2, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        color: Theme.of(context)
                            .primaryColor
                            .withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              }),
            );
          } else {
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(articles.length, (index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsScreen(article),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  article.document!.documentPath!,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            article.articleTitle!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.perm_contact_calendar,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                article.user!.name!,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(182, 103, 109, 106),
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
        } else if (snapshot.hasError) {
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 5),
                      color: Theme.of(context)
                          .primaryColor
                          .withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            }),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
