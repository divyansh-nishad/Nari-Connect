import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nari_connect/Screens/auth_page.dart';
import 'package:nari_connect/Screens/books_page.dart';
import 'package:nari_connect/Screens/job_opp.dart';
import 'package:nari_connect/Screens/profile_page.dart';
import 'package:nari_connect/Screens/search_page.dart';
import '../Screens/home_page.dart';
import '../helper/helper_function.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../widgets/group_tile.dart';
import '../widgets/widgets.dart';

class DrawerWidget extends StatefulWidget {
  final User user; // User object as input parameter

  const DrawerWidget(
      {super.key, required this.user}); // Constructor with User parameter

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  Stream? groups;

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    nextScreenReplace(context, const AuthPage());
  }

  gettingUserData() async {
    userName = widget.user.displayName!;
    email = widget.user.email!;
    await DatabaseService(uid: widget.user.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          if (widget.user.photoURL != null)
            CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(widget.user.photoURL!),
            ),
          // if (user.photoURL == null) GestureDetector(),
          if (widget.user.photoURL == null)
            Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.grey[700],
            ),
          // Icon(
          //   Icons.account_circle,
          //   size: 150,
          //   color: Colors.grey[700],
          // ),
          const SizedBox(
            height: 15,
          ),
          Text(
            userName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              nextScreen(context, HomePage());
            },
            selectedColor: Colors.pinkAccent,
            selected: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Groups",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              nextScreenReplace(
                  context,
                  ProfilePage(
                    userName: userName,
                    email: email,
                  ));
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              nextScreenReplace(context, JobOpportunitiesScreen());
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Jobs",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              nextScreenReplace(context, BooksPage());
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Resources",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            signUserOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const AuthPage()),
                                (route) => false);
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  });
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
