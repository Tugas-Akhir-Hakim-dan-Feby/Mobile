import 'dart:convert';
import 'package:http/http.dart' as http;

class Article {
  final String title;
  final String content;
  final String image;

  Article({required this.title, required this.content, required this.image});
}

Future<List<Article>> fetchArticles() async {
  final response = await http.get(
    Uri.parse('https://develop-ta.berobatplus.shop/api/v1/article'),
  );

  if (response.statusCode == 200) {
    final jsonResult = json.decode(response.body);
    final articles = jsonResult['data'] as List<dynamic>;

    return articles.map((jsonArticle) {
      return Article(
        title: jsonArticle['article_title'],
        content: jsonArticle['article_content'],
        image: jsonArticle['document']['document_path'],
      );
    }).toList();
  } else {
    throw Exception('Failed to fetch articles');
  }
}
