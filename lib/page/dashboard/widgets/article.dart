import 'dart:convert';
import 'package:api_mobile/model/articles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_mobile/page/dashboard/details/details_screen.dart';
import 'package:sp_util/sp_util.dart';

class Articles extends StatelessWidget {
  Future<Article> fetchArticles() async {
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
        print("masukkkkkkkkkkkkkkkkkkkkkkkkkkk");
        print(response.statusCode);
        print(response.body);
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
    return FutureBuilder<Article>(
      future: fetchArticles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          final articles = snapshot.data!.data;
          return GridView.count(
            padding: const EdgeInsets.only(top: 20),
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
                  MaterialPageRoute(builder: (_) =>  DetailsScreen()),
                ),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        color: Theme.of(context).primaryColor.withOpacity(.2),
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
                              image: NetworkImage(article.document.documentPath),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          article.articleTitle,
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              color: Colors.grey, size: 18),
                          const SizedBox(width: 5),
                          Text(
                            'Location of place',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
