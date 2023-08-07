import 'package:flutter/material.dart';

import 'create.dart';
import 'main_app_view.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Main Page'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainAppView()),
                );
              },
            ),
            ListTile(
              title: Text('Create Page'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()),
                );
              },
            ),
            // Add more items as needed for the IndexPage drawer
          ],
        ),
      ),
      body: Center(
        child: Text('This is the Index Page'),
      ),
    );
  }
}
