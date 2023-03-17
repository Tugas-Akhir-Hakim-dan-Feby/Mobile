import 'package:api_mobile/auth/style_alert.dart';
import 'package:api_mobile/components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
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
                  top: 20, bottom: 25, right: 00, left: 0),
              child: Column(
                children: [
                  Row(
                    children: [
                                        Column(
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: const BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://propertiku.proyek.ti.polindra.ac.id/storage/app/public/image/huDgnXg7E4GVACHMXVvsdXtH1iWMCbG96boRmsrU.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: (size.width - 40) * 0.6,
                        child: Column(
                          children: const [
                            Text(
                              "Dominic Toretto",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: mainFontColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Member Welder",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  
                  
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\Dominic Maulana",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: mainFontColor),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: const [
                            Text(
                              "\Alan@gmail.com",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainFontColor),
                            ),
                          ],
                        ),
                        SizedBox(
                              height: 15,
                            ),
                        Column(
                          children: const [
                            Text(
                              "Alamat",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainFontColor),
                            ),
                          ],
                        ),
                            SizedBox(
                              height: 15,
                            ),
                        Container(
                          width: 400,
                          height: 1,
                          color: black.withOpacity(0.3),
                        ),
                        Column(
                          children: const [
                            Text(
                              "0877676767689",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainFontColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Loan",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: black),
                            ),
                          ],
                        ),
                      ],
                      
                    ),
                  )
                
                    ],
                  ),

                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                        context, 'edit_profile');
                        },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                        // Icons.edit_square,
                        Icons.edit_note_sharp, 
                        color: Colors.grey,
                        size: 35,
                      ),
                      ],
                    ),
                  ),
                  


                
                
//                 Container(
//   decoration: BoxDecoration(
//     border: Border.all(
//       color: Colors.black.withOpacity(0.3),
//       width: 0.5,
//     ),
//     borderRadius: BorderRadius.circular(5),
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       Column(
//         children: const [
//           Text(
//             "\$8900",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: mainFontColor),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             "Income",
//             style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w100,
//                 color: black),
//           ),
//         ],
//       ),
//       Container(
//         width: 0.5,
//         height: 40,
//         color: Colors.black.withOpacity(0.3),
//       ),
//       Column(
//         children: const [
//           Text(
//             "\$5500",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: mainFontColor),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             "Expenses",
//             style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w100,
//                 color: black),
//           ),
//         ],
//       ),
//       Container(
//         width: 0.5,
//         height: 40,
//         color: Colors.black.withOpacity(0.3),
//       ),
//       Column(
//         children: const [
//           Text(
//             "\$890",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: mainFontColor),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             "Loan",
//             style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w100,
//                 color: black),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),

                
                ],
              ),
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
                // Text("Overview",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: mainFontColor,
                //     )),
                const Text("Maret 16, 2023",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: mainFontColor,
                    )),
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
                                    ), onPressed: () { 
                                      Navigator.pushNamed(context, 'certificate_page');
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
                                    ), onPressed: () { 
                                      Navigator.pushNamed(context, 'member_profile_page');
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
                                    ), onPressed: () { 
                                      Navigator.pushNamed(context, 'profile_edit_password_page');
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
                                    ), onPressed: () { 
                                      Navigator.pushNamed(context, 'terms_condition_page');
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
                                    ), onPressed: () { 
                                      Navigator.pushNamed(context, 'follow_us_page');
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
                                    ), onPressed: () { 
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
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.exit_to_app_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Alert(
                                        context: context,
                                        alertAnimation: fadeAlertAnimation,
                                        style: AlertStyle(
                                          isCloseButton: false,
                                        ),
                                        // type: AlertType.warning,
                                        title: "Apakah Anda Akan Keluar",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Batal",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: arrowbgColor,
                                          ),
                                          DialogButton(
                                            child: Text(
                                              "Keluar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            onPressed: () => {
                                              SpUtil.clear(),
                                              Navigator.pushReplacementNamed(
                                                  context, "login_page"),
                                            },
                                            gradient: LinearGradient(colors: [
                                              Color.fromRGBO(255, 21, 0, 1),
                                              Color.fromRGBO(220, 38, 38, 1),
                                              Color.fromRGBO(237, 39, 21, 1),
                                            ]),
                                          )
                                        ],
                                      ).show();
                                    },
                                  ),
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
          )
        ],
      
      ),
    ));
  }
}
