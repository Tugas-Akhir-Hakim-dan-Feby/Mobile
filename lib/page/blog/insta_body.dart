import 'package:api_mobile/page/blog/insta_list.dart';
import 'package:flutter/material.dart';

class InstaBody extends StatelessWidget {
  const InstaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[
        // Expanded(flex: 1, child: new InstaStories()),
        Flexible(child: InstaList())
      ],
    );
  }
}
