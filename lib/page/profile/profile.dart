import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final List<Map> myProducts = List.generate(10, (index) => {"id": index, "name": "Product $index"}).toList();
  @override
  
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('GridView'),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   // implement GridView.builder
      //   child: GridView.builder(
      //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //           maxCrossAxisExtent: 380,
      //           childAspectRatio:1,
      //           crossAxisSpacing: 20,
      //           mainAxisSpacing: 20),
      //       itemCount: myProducts.length,
      //       itemBuilder: (BuildContext ctx, index) {
      //         return Container(
              
      //           alignment: Alignment.center,
      //           decoration: BoxDecoration(
      //               color: Colors.blueAccent,
      //               borderRadius: BorderRadius.circular(15)),
      //           child: Text(
      //             myProducts[index]["name"],
      //             style: TextStyle(color: Colors.white, fontSize: 20),
      //           ),
      //         );
      //       }),
      // ),
    );
  }
}