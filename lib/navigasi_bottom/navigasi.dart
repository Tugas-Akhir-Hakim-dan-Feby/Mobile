import 'package:api_mobile/page/blog/blog.dart';
import 'package:api_mobile/page/chat/chat.dart';
import 'package:api_mobile/page/home/home.dart';
import 'package:api_mobile/page/member/member.dart';
import 'package:api_mobile/page/profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Navigasi extends StatefulWidget {
  const Navigasi({Key? key}) : super(key: key);

  @override
  State<Navigasi> createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int? index = 0;
  final screens = [
    HomePage(),
    const BlogPage(),
    const MemberPage(),
    const ChatPage(),
    const ProfilePage(),

  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.connect_without_contact, size: 30),
      const Icon(Icons.assignment_sharp, size: 30),
      const Icon(Icons.chat_outlined, size: 30),
      const Icon(Icons.account_circle_sharp, size: 30),
    ];
    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 255, 255, 255))),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.brown.shade200,
            buttonBackgroundColor: const Color.fromARGB(255, 239, 48, 48),
            backgroundColor: Colors.transparent,
            // backgroundColor: Color.fromARGB(255, 255, 255, 255),
            items: items,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 650),
            index: index!,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
        body: screens[index!]);
  }
}
