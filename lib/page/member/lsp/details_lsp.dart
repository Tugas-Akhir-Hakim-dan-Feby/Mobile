
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:api_mobile/model/articles.dart';

class DetailsInstitutionOfProfessionalCertification extends StatelessWidget {
  final Data article;

  DetailsInstitutionOfProfessionalCertification(this.article);

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
