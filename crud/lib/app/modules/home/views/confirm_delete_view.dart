import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ConfirmDeleteView extends StatelessWidget {
  final HomeController _controller = Get.find<HomeController>();

  void _deleteUser() async {
    String userId = Get.arguments['id'];
    await _controller.deleteUser(userId);
    Get.back(); // Navigate back to the index view after deleting the user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Delete'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to delete this user?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteUser,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () => Get.back(), // Navigate back if cancel is pressed
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
