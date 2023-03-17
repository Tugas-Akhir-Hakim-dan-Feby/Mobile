import 'package:api_mobile/page/blog/insta_body.dart';
import 'package:flutter/material.dart';
class BlogPage extends StatelessWidget {
  final topBar = AppBar(
    backgroundColor: const Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: const Icon(Icons.camera_alt),
    title: SizedBox(
        height: 35.0, child: Image.asset("assets/images/tulisan_logo_api.png")),
    actions: const <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(Icons.send),
      )
    ],
  );

  BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topBar,
        body: const InstaBody(),
        // bottomNavigationBar: new Container(
        //   color: Colors.white,
        //   height: 50.0,
        //   alignment: Alignment.center,
        //   child: new BottomAppBar(
        //     child: new Row(
        //       // alignment: MainAxisAlignment.spaceAround,
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: <Widget>[
        //         new IconButton(
        //           icon: Icon(
        //             Icons.home,
        //           ),
        //           onPressed: () {},
        //         ),
        //         new IconButton(
        //           icon: Icon(
        //             Icons.search,
        //           ),
        //           onPressed: null,
        //         ),
        //         new IconButton(
        //           icon: Icon(
        //             Icons.add_box,
        //           ),
        //           onPressed: null,
        //         ),
        //         new IconButton(
        //           icon: Icon(
        //             Icons.favorite,
        //           ),
        //           onPressed: null,
        //         ),
        //         new IconButton(
        //           icon: Icon(
        //             Icons.account_box,
        //           ),
        //           onPressed: null,
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        );
  }
}
