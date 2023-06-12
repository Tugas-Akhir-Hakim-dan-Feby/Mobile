import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:api_mobile/page/Screens/chat_room.dart';
import 'package:api_mobile/page/group_chats/group_chat_screen.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  List<DocumentSnapshot> userList = [];
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? currentSearchValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    setStatus("Online");
    fetchUsers();
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1.toLowerCase().codeUnitAt(0) > user2.toLowerCase().codeUnitAt(0)) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void fetchUsers() async {
    setState(() {
      isLoading = true;
    });

    final QuerySnapshot userSnapshot =
        await _firestore.collection('users').get();

    List<DocumentSnapshot> users = userSnapshot.docs;

    List<DocumentSnapshot> usersWithChats = [];

    for (var user in users) {
      QuerySnapshot chatSnapshot = await _firestore
          .collection('chatroom')
          .doc(chatRoomId(_auth.currentUser!.displayName!, user['name']))
          .collection('chats')
          .get();

      if (chatSnapshot.docs.isNotEmpty) {
        usersWithChats.add(user);
      }
    }

    setState(() {
      userList = usersWithChats;
      isLoading = false;
    });
  }

  void performSearch() {
    String searchValue = _search.text.trim();

    if (searchValue.isNotEmpty) {
      onSearch(searchValue);
    } else {
      clearSearch();
    }
  }

  void onSearch(String searchValue) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await firestore
        .collection('users')
        .where("name", isEqualTo: searchValue.toLowerCase())
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        setState(() {
          userList = value.docs;
          isLoading = false;
          currentSearchValue = searchValue;
        });
        print(userList);
      } else {
        await firestore
            .collection('users')
            .where("name", isEqualTo: searchValue.toUpperCase())
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            setState(() {
              userList = value.docs;
              isLoading = false;
              currentSearchValue = searchValue;
            });
            print(userList);
          } else {
            setState(() {
              userList =
                  []; // Mengosongkan userList jika pengguna tidak ditemukan
              isLoading = false;
              currentSearchValue = searchValue;
            });
            print('User not found');
          }
        });
      }
    });
  }

  void clearSearch() {
    setState(() {
      _search.clear();
      currentSearchValue = null;
    });
  }

  Future<String> _fetchSVGFromAPI() async {
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
      print(documentPath);
      return documentPath;
    } else {
      throw Exception('Gagal memuat data SVG');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: isLoading
          ? Center(
              child: SizedBox(
                height: size.height / 20,
                width: size.height / 20,
                child: const CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _search,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: GestureDetector(
                          onTap: performSearch, // Added onTap function here
                          child: Icon(
                            Icons.search,
                            color: _search.text.isNotEmpty
                                ? Colors.grey
                                : Colors.blue,
                          ),
                        ),
                        suffixIcon: _search.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.close),
                                onPressed: clearSearch,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(
                  onPressed: performSearch,
                  child: const Text("Search"),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('users').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        userList = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            final user =
                                userList[index].data() as Map<String, dynamic>;
                            final userId = userList[index].id;
                            final bool isOnline = user['status'] == 'Online';

                            if (currentSearchValue != null &&
                                !user['name'].toString().toLowerCase().contains(
                                    currentSearchValue!.toLowerCase())) {
                              return SizedBox.shrink();
                            }

                            return ListTile(
                              onTap: () {
                                String roomId = chatRoomId(
                                    _auth.currentUser!.displayName!,
                                    user['name']);

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ChatRoom(
                                      chatRoomId: roomId,
                                      userMap: user,
                                    ),
                                  ),
                                );
                              },
                              leading: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/user.png'), // Replace with the path to your user photo asset
                                    backgroundColor: Colors.white,
                                  ),
                                  if (isOnline)
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              title: Text(
                                user['name'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(user['email']),
                              trailing:
                                  const Icon(Icons.chat, color: Colors.black),
                            );
                          },
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.group),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const GroupChatHomeScreen(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}
