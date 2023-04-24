import 'package:flutter/material.dart';
import 'package:nari_connect/widgets/job_list.dart';
import 'package:nari_connect/widgets/tag_list.dart';

class JobOpportunitiesScreen extends StatelessWidget {
  const JobOpportunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Opportunities'),
      ),
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
              title: const Text('10 tips for job searching during a pandemic'),
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
