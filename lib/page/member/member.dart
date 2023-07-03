import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:api_mobile/components/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                                            Navigator.pushNamed(context, '/lsp');
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 30,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                color: white,
                                // borderRadius: BorderRadius.circular(25),
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
                                        child: Icon(Icons.business )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 50) * 0.7,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Lembaga Sertifikasi",
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
                                            Navigator.pushNamed(context, '/lsp');
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/job_vacancy');
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                color: white,
                                // borderRadius: BorderRadius.circular(25),
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
                                        child: Icon(Icons.work_history_sharp)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 50) * 0.7,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Lowongan Pekerjaan",
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
                            Navigator.pushNamed(context, '/job_vacancy');
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
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
                        child: GestureDetector(
                          onTap: () {
                        Navigator.pushNamed(context, '/skills_chart');
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                color: white,
                                // borderRadius: BorderRadius.circular(25),
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
                                        child: Icon(Icons.insert_chart_outlined_rounded )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 50) * 0.7,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Grafik Jenis Keahlian",
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
                                                                Navigator.pushNamed(context, '/skills_chart');
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
