import 'package:api_mobile/page/blog/blog.dart';
import 'package:api_mobile/page/chat/chat.dart';
import 'package:api_mobile/page/dashboard/dashboard.dart';
import 'package:api_mobile/page/member/member.dart';
import 'package:api_mobile/page/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavigasiPage extends StatefulWidget {
  const NavigasiPage({super.key});

  
  @override
  // ignore: library_private_types_in_public_api
  _NavigasiPageState createState() => _NavigasiPageState();
}

class _NavigasiPageState extends State<NavigasiPage> {
  
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // static const List<Widget> _widgetOptions = <Widget>[
    // Text(
    //   'Home',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Likes',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Search',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Profile',
    //   style: optionStyle,
    // ),
  // ];
  final screens = [
    const Dashboard(),
    BlogPage(),
    const MemberPage(),
    const ChatPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_label
    resizeToAvoidBottomPadding: false;
    return Scaffold(
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 27,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              // textSize: 100,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Beranda',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Blog',
                ),
                GButton(
                  icon: LineIcons.moneyCheck,
                  text: 'Member',
                ),
                GButton(
                  icon: LineIcons.facebookMessenger,
                  text: 'Pesan',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}