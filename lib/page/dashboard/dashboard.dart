import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_mobile/page/dashboard/details/details_screen.dart';
import 'package:api_mobile/page/dashboard/widgets/item_travel.dart';
import 'package:api_mobile/page/dashboard/widgets/item_category.dart';

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
        title: Text('DASHBOARD'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Hello Good Morning',
                    //   style: GoogleFonts.poppins(
                    //       fontSize: 14, fontWeight: FontWeight.w400),
                    // ),
                    Text(
                      'Montree MT',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(14),
                  child: Icon(Iconsax.notification),
                  shape: const CircleBorder(
                      side: BorderSide(color: Colors.black12)),
                )
              ],
            ),
          ),
          // Search
          Container(
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Theme.of(context).primaryColor.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 5)
                ]),
            child: Row(
              children: const [
                SizedBox(width: 15),
                Icon(CupertinoIcons.search, color: Colors.grey),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Menggunakan 80% lebar layar
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'Post $index',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 30,
            margin: const EdgeInsets.only(top: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ItemCategory(title: 'Experiences',),
              ],
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.only(top: 20),
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ItemTravel(title: 'Awesome Place 1', img: 'place1.jpg'),
              ItemTravel(title: 'Awesome Place 2', img: 'place2.jpg'),
              ItemTravel(title: 'Awesome Place 3', img: 'place3.jpg'),
              ItemTravel(title: 'Awesome Place 4', img: 'place4.jpg'),
            ],
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/widgets.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }