// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMembersINGroup extends StatefulWidget {
  final String groupapi_mobileId, name;
  final List membersList;
  const AddMembersINGroup(
      {required this.name,
      required this.membersList,
      required this.groupapi_mobileId,
      Key? key, required String groupChatId})
      : super(key: key);

  @override
  _AddMembersINGroupState createState() => _AddMembersINGroupState();
}

class _AddMembersINGroupState extends State<AddMembersINGroup> {
  final TextEditingController _search = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  List membersList = [];

  @override
  void initState() {
    super.initState();
    membersList = widget.membersList;
  }

 void onSearch() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  setState(() {
    isLoading = true;
  });

  String searchValue = _search.text;

  await firestore
      .collection('users')
      .where("name", isEqualTo: searchValue.toLowerCase())
      .get()
      .then((value) async {
    if (value.docs.isNotEmpty) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
    } else {
      await firestore
          .collection('users')
          .where("name", isEqualTo: searchValue.toUpperCase())
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          setState(() {
            userMap = value.docs[0].data();
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  });
}

  void onAddMembers() async {
    membersList.add(userMap);

    await _firestore.collection('groups').doc(widget.groupapi_mobileId).update({
      "members": membersList,
    });

    await _firestore
        .collection('users')
        .doc(userMap!['uid'])
        .collection('groups')
        .doc(widget.groupapi_mobileId)
        .set({"name": widget.name, "id": widget.groupapi_mobileId});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Members"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            isLoading
                ? Container(
                    height: size.height / 12,
                    width: size.height / 12,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: onSearch,
                    child: const Text("Search"),
                  ),
            userMap != null
                ? ListTile(
                    onTap: onAddMembers,
                    leading: const Icon(Icons.account_box),
                    title: Text(userMap!['name']),
                    subtitle: Text(userMap!['email']),
                    trailing: const Icon(Icons.add),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
