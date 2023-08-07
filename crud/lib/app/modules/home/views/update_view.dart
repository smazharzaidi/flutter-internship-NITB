import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class UpdateView extends StatefulWidget {
  @override
  _UpdateViewState createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  final HomeController _controller = Get.find<HomeController>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Get the user data passed from the index view
    Map<String, dynamic> user = Get.arguments;
    _nameController.text = user['name'];
    _cnicController.text = user['cnic'];
  }

  void _updateUser() async {
    String userId = Get.arguments['id'];
    String name = _nameController.text.trim();
    String cnic = _cnicController.text.trim();

    if (name.isNotEmpty && cnic.isNotEmpty) {
      await _controller.updateUser(userId, name, cnic);
      Get.back(); // Navigate back to the index view after updating the user
    } else {
      // Show an error message if any field is empty
      Get.snackbar(
        'Error',
        'Please fill all fields.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _cnicController,
              decoration: InputDecoration(labelText: 'CNIC'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}
