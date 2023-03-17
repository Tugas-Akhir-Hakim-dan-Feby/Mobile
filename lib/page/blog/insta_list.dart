// ignore_for_file: library_private_types_in_public_api

import 'package:api_mobile/page/blog/insta_stories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstaList extends StatefulWidget {
  const InstaList({super.key});

  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) => index == 0
          ? 
          SizedBox(
              height: deviceSize.height * 0.15,
              child: InstaStories(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://dagodreampark.co.id/images/ke_2.jpg")),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            "Alan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.network(
                    "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(isPressed
                                ? Icons.favorite
                                : FontAwesomeIcons.heart),
                            color: isPressed ? Colors.red : Colors.black,
                            onPressed: () {
                              setState(() {
                                isPressed = !isPressed;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          const Icon(
                            FontAwesomeIcons.comment,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          const Icon(FontAwesomeIcons.paperPlane),
                        ],
                      ),
                      const Icon(FontAwesomeIcons.bookmark)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Liked by pawankumar, pk and 528,331 others",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://dagodreampark.co.id/images/ke_2.jpg")),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment...",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child:
                      Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
                )
              ],
            ),
    );
  }
}
