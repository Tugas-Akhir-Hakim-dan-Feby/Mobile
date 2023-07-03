import 'package:api_mobile/components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class MemberProfilePage extends StatefulWidget {
  const MemberProfilePage({super.key});

  @override
  State<MemberProfilePage> createState() => _MemberProfilePageState();
}

class _MemberProfilePageState extends State<MemberProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          'Keanggotaan API',
          style: TextStyle(
            color: Color.fromARGB(246, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
  children: [
    if (SpUtil.getString('role_id') != '6' && SpUtil.getString('role_id') != '5')
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/form_member_welder');
          },
          child: Container(
            margin: const EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
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
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                right: 5,
                left: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Icon(Icons.person),
                      // child: Icon(Icons.admin_panel_settings_sharp)
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: (size.width - 50) * 0.7,
                      margin: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Daftar menjadi anggota welder",
                            style: TextStyle(
                              fontSize: 19,
                              color: black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: arrowbgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/form_member_welder');
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
  ],
),
Row(
  children: [
    if (SpUtil.getString('role_id') != '6' && SpUtil.getString('role_id') != '5')
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/form_member_company');
          },
          child: Container(
            margin: const EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
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
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                right: 5,
                left: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Icon(Icons.supervised_user_circle ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: (size.width - 50) * 0.7,
                      margin: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Daftar menjadi anggota company",
                            style: TextStyle(
                              fontSize: 19,
                              color: black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: arrowbgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/form_member_company');
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
  ],
),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, '/edit_profile_member_welder');
                    //         },
                    //         child: Container(
                    //           margin: const EdgeInsets.only(
                    //             top: 30,
                    //             left: 15,
                    //             right: 15,
                    //           ),
                    //           decoration: BoxDecoration(
                    //             color: white,
                    //             borderRadius: BorderRadius.circular(25),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: grey.withOpacity(0.03),
                    //                 spreadRadius: 10,
                    //                 blurRadius: 3,
                    //                 // changes position of shadow
                    //               ),
                    //             ],
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //               top: 10,
                    //               bottom: 10,
                    //               right: 5,
                    //               left: 10,
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 Container(
                    //                   width: 45,
                    //                   height: 50,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(15),
                    //                   ),
                    //                   child: const Center(
                    //                     child: Icon(Icons.person),
                    //                     // child: Icon(Icons.admin_panel_settings_sharp)
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //                     width: (size.width - 50) * 0.7,
                    //                     margin: const EdgeInsets.symmetric(
                    //                       vertical: 12.0,
                    //                     ),
                    //                     child: Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: const [
                    //                         Text(
                    //                           "Edit Profil Welder",
                    //                           style: TextStyle(
                    //                             fontSize: 19,
                    //                             color: black,
                    //                             fontWeight: FontWeight.bold,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   width: 50,
                    //                   height: 50,
                    //                   decoration: BoxDecoration(
                    //                     color: arrowbgColor,
                    //                     borderRadius: BorderRadius.circular(15),
                    //                   ),
                    //                   child: IconButton(
                    //                     icon: const Icon(
                    //                       Icons.arrow_forward,
                    //                       color: Colors.black,
                    //                     ),
                    //                     onPressed: () {
                    //                       Navigator.pushNamed(
                    //                         context,
                    //                         '/edit_profile_member_welder',
                    //                       );
                    //                     },
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 6,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, '/edit_profile_member_welder');
                    //         },
                    //         child: Container(
                    //           margin: const EdgeInsets.only(
                    //             top: 30,
                    //             left: 15,
                    //             right: 15,
                    //           ),
                    //           decoration: BoxDecoration(
                    //             color: white,
                    //             borderRadius: BorderRadius.circular(25),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: grey.withOpacity(0.03),
                    //                 spreadRadius: 10,
                    //                 blurRadius: 3,
                    //                 // changes position of shadow
                    //               ),
                    //             ],
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //               top: 10,
                    //               bottom: 10,
                    //               right: 5,
                    //               left: 10,
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 Container(
                    //                   width: 45,
                    //                   height: 50,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(15),
                    //                   ),
                    //                   child: const Center(
                    //                     child: Icon(Icons.supervised_user_circle),
                    //                     // child: Icon(Icons.admin_panel_settings_sharp)
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: Container(
                    //                     width: (size.width - 50) * 0.7,
                    //                     margin: const EdgeInsets.symmetric(
                    //                       vertical: 12.0,
                    //                     ),
                    //                     child: Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: const [
                    //                         Text(
                    //                           "Edit Profil Welder Company",
                    //                           style: TextStyle(
                    //                             fontSize: 19,
                    //                             color: black,
                    //                             fontWeight: FontWeight.bold,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   width: 50,
                    //                   height: 50,
                    //                   decoration: BoxDecoration(
                    //                     color: arrowbgColor,
                    //                     borderRadius: BorderRadius.circular(15),
                    //                   ),
                    //                   child: IconButton(
                    //                     icon: const Icon(
                    //                       Icons.arrow_forward,
                    //                       color: Colors.black,
                    //                     ),
                    //                     onPressed: () {
                    //                       Navigator.pushNamed(
                    //                         context,
                    //                         '/edit_profile_member_welder',
                    //                       );
                    //                     },
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 6,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/payment_history');
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 30,
                                left: 15,
                                right: 15,
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
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  right: 5,
                                  left: 10,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons. account_balance_wallet_rounded 
   ),
                                      
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: (size.width - 50) * 0.7,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 12.0,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Riwayat pembayaran",
                                              style: TextStyle(
                                                fontSize: 19,
                                                color: black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: arrowbgColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/payment_history',
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
