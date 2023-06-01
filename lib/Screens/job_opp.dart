import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nari_connect/Screens/profile_page.dart';
import 'package:nari_connect/widgets/job_list.dart';
import 'package:nari_connect/widgets/tag_list.dart';

import '../widgets/widgets.dart';
import 'auth_page.dart';
import 'home_page.dart';

class JobOpportunitiesScreen extends StatelessWidget {
  JobOpportunitiesScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Opportunities'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.grey[700],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            user.displayName!,
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
                    userName: user.displayName!,
                    email: user.email!,
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
            onTap: () {},
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Jobs",
              style: TextStyle(color: Colors.black),
            ),
            selectedColor: Colors.pinkAccent,
            selected: true,
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
      )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Find your next job opportunity',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TagsList(),
            ),
            JobList(),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Career guidance',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Here are some resources to help you with your job search:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('How to write a great resume'),
              subtitle: const Text('Article on LinkedIn'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to article on LinkedIn
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('How to ace your next job interview'),
              subtitle: const Text('Video on YouTube'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to video on YouTube
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('10 tips for job searching during a recession'),
              subtitle: const Text('Article on Indeed'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to article on Indeed
              },
            ),
          ],
        ),
      ),
    );
  }
}
