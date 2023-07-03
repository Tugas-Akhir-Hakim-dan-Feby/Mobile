import 'dart:convert';

import 'package:api_mobile/model/articles.dart';
import 'package:api_mobile/page/dashboard/articles/articles.dart';
import 'package:api_mobile/page/dashboard/articles/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sp_util/sp_util.dart';

import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DASHBOARD',
          style: TextStyle(
              color: Colors.white), // Mengubah warna teks menjadi putih
        ),
        backgroundColor: Color.fromARGB(255, 255, 0,
            0), // Mengubah warna latar belakang menggunakan RGB (255, 0, 0)
      ),
      // appBar: AppBar(
      //   title: Text(
      //     'DASHBOARD',
      //      style: TextStyle(
      //       color: Color.fromRGBO(255, 255, 255, 1),
      //       fontSize: 21,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),// Mengubah warna latar belakang menggunakan RGB (255, 0, 0)
      // ),
      body: DashboardScreen(
        onSearchChanged: (query) {
          setState(() {
            searchQuery = query;
          });
        },
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  final Function(String) onSearchChanged;

  const DashboardScreen({required this.onSearchChanged});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
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
      final document = jsonResponse['document'];
      final documentPath = document['document_path'];
      SpUtil.putString("save_image", document['document_path']);
      // print(documentPath);
      return documentPath;
    } else {
      throw Exception('Gagal memuat data Foto');
    }
  }

  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    String? documentPath = SpUtil.getString("save_image");
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (SpUtil.getString("save_image") != null)
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: CachedNetworkImageProvider(
                      SpUtil.getString("save_image") ?? '',
                    ),
                  )
                else
                  FutureBuilder<String>(
                    future: _fetchProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Container(),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              CachedNetworkImageProvider(snapshot.data!),
                        );
                      } else if (snapshot.hasError) {
                        return CircleAvatar(
                          radius: 35,
                          child: Image.asset('assets/user.png'),
                        );
                      } else {
                        return CircleAvatar(
                          radius: 35,
                          child: Image.asset('assets/user.png'),
                        );
                      }
                    },
                  ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SpUtil.getString('name') ?? "Nama",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: 15),
                Icon(CupertinoIcons.search, color: Colors.grey),
                Expanded(
                  child: TextField(
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query;
                      });
                      widget.onSearchChanged(query);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 190.0,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: imageList.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey,
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(
                          imageList[index],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 180.0,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    imageList.length,
                    (index) => Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, top: 10, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Artikel',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(138, 127, 127, 1),
                  ),
                ),
              ],
            ),
          ),
          Articles(searchQuery),
        ],
      ),
    );
  }
}
List<String> imageList = [
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/Erling_Haaland_2023_%28cropped-v2%29.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/Erling_Haaland_2023_%28cropped-v2%29.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/Erling_Haaland_2023_%28cropped-v2%29.jpg',
  // tambahkan URL gambar lainnya di sini
];
