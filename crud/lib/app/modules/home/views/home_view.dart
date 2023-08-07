import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: buildDrawer(),
      body: Center(
        child: Text(
          'Welcome to Home View!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'App Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Get.back(); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Create User'),
            onTap: () {
              Get.toNamed('/create'); // Navigate to the CreateView
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('User List'),
            onTap: () {
              Get.toNamed('/index'); // Navigate to the IndexView
            },
          ),
        ],
      ),
    );
  }
}
