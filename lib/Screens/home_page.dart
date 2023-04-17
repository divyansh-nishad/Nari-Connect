import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nari_connect/Screens/search_page.dart';
import 'package:nari_connect/main.dart';

import '../helper/helper_function.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  String userName = "";

  String email = "";

  AuthService authService = AuthService();

  Stream? groups;

  bool _isLoading = false;

  String groupName = "";

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  // string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  // gettingUserData() {
  //   userName = "Hello";
  // }
  gettingUserData() async {
    await HelperFunction.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunction.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    // getting the list of snapshots in our stream
    // await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
    //     .getUserGroups()
    //     .then((snapshot) {
    //   setState(() {
    //     groups = snapshot;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search)),
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: const Text(
          'Nari Connect',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.pink,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.displayName!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Search'),
              onTap: () {
                navigatorKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: signUserOut,
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Logged in as : ' + user.email!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
