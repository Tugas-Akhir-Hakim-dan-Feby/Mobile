// ignore_for_file: sort_child_properties_last, duplicate_ignore, unnecessary_string_escapes

import 'dart:convert';

import 'package:api_mobile/auth/style_alert.dart';
import 'package:api_mobile/components/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<String> _fetchProfile() async {
    final token = SpUtil.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan');
    }

    final headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.parse('https://develop-ta.berobatplus.shop/api/v1/user/me'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final user = jsonResponse['user'];
      final document = user['document'];
      final documentPath = document['document_path'];
      SpUtil.putString("save_image", documentPath);
      // String? savedImagePath = SpUtil.getString("save_image");

      print(documentPath);

      return documentPath;
    } else {
      throw Exception('Gagal memuat data SVG');
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('MMMM dd, yyyy ');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 25, left: 25, right: 25, bottom: 10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                    // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 25, right: 5, left: 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://develop-ta.berobatplus.shop/api/v1/user/me",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: FutureBuilder<String>(
                                    future: _fetchProfile(),
                                    // Mengambil SVG dari API
                                    builder: (context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0), // Changed to square shape
        ),
      ),
    );
  } else if (snapshot.hasData) {
    return CachedNetworkImage(
      imageUrl: snapshot.data!,
      fit: BoxFit.cover,
    );
  } else if (snapshot.hasError) {
    return Image.asset('assets/user.png');
  } else {
    return Image.asset('assets/user.png');
  }
},

                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: (size.width - 40) * 0.6,
                                  child: Column(
                                    children: [
                                      Text(
                                        SpUtil.getString('name') ?? "Nama",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: mainFontColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        SpUtil.getString('email') ??
                                            "\Email Tidak Ada",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  Text(
                                    getUserRole() ?? "\Belum Verifikasi",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: mainFontColor,
                                    ),
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  Text(
                                    "\087835766946",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: mainFontColor,
                                    ),
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  Text(
                                    "\Skilss Flutter",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: mainFontColor,
                                    ),
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  Text(
                                    "\21 Tahun",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: mainFontColor,
                                    ),
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: black.withOpacity(0.3),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                          Text(
                            "Edit",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text("Pemberitahuan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: mainFontColor,
                              )),
                          IconBadge(
                            icon: const Icon(Icons.notifications_none),
                            itemCount: 1,
                            badgeColor: Colors.red,
                            itemColor: mainFontColor,
                            hideZero: true,
                            top: -1,
                            onTap: () {
                              // print('test');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    getCurrentDateTime(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: mainFontColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    // child: Icon(Icons.ballot_outlined)
                                    child: Icon(Icons.dataset_linked_rounded)),
                              ),
                              Expanded(
                                child: Container(
                                  // width: (size.width - 50) * 222,
                                  margin: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Sertifikat",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                // child: const Center(
                                //     child: Icon(Icons.arrow_forward)),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'certificate_page');
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.assignment_ind)),
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 50) * 0.7,
                                  margin: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Keanggotaan",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'member_profile_page');
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.vpn_key_outlined)),
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 50) * 0.7,
                                  margin: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ubah Kata Sandi",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'profile_edit_password_page');
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.add_moderator)
                                    // child: Icon(Icons.admin_panel_settings_sharp )
                                    ),
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 50) * 0.7,
                                  margin: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Syarat & Ketentuan",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'terms_condition_page');
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.lan_outlined)),
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 50) * 0.7,
                                  margin: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ikuti kami",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'follow_us_page');
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    child: Icon(Icons.announcement_outlined)),
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 50) * 0.7,
                                  margin: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Bantuan",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'help_page');
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.03),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 5, left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: arrowbgColor,
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: const Center(
                                    // child: Icon(Icons.token_sharp)
                                    child: Icon(Icons.token_sharp)),
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 50) * 0.7,
                                  margin: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Keluar",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 0, 0, 1),
                                  borderRadius: BorderRadius.circular(15),
                                  // shape: BoxShape.circle
                                ),
                                child: IconButton(
  icon: Icon(
    Icons.exit_to_app_outlined,
    color: Colors.white,
  ),
  onPressed: () {
  showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Apakah Anda Akan Keluar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    "Batal",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    primary: arrowbgColor,
                    onPrimary: Colors.black,
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    "Keluar",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () async {
                    SpUtil.clear();
                    await _auth.signOut().then((value) {
                      Navigator.pushReplacementNamed(context, "login_page");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 21, 0, 1),
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);

  },
),

                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? getUserRole() {
  String? roleId = SpUtil.getString('role_id');
  switch (roleId) {
    case '1':
      return 'Admin';
    case '2':
      return 'User';
    case '3':
      return 'Super Admin';
    default:
      return null;
  }
} 