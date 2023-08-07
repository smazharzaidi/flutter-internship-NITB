import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class IndexView extends StatelessWidget {
  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];
            return _buildUserCard(user);
          },
        ),
      ),
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
    return Card(
      child: ListTile(
        title: Text(user['name']),
        subtitle: Text('CNIC: ${user['cnic']}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () => _viewImage(user['image']),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _updateUser(user),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _confirmDelete(user),
            ),
          ],
        ),
      ),
    );
  }

  void _viewImage(String imageUrl) {
    // Implement the logic to view the stored image, e.g., open a dialog with the image.
    // You can use packages like `photo_view` to display the image in a full-screen view.
    Get.snackbar('View Image', 'View image feature not implemented yet.',
        snackPosition: SnackPosition.BOTTOM);
  }

  void _updateUser(Map<String, dynamic> user) {
    // Navigate to the update view with the user data.
    Get.toNamed('/update', arguments: user);
  }

  void _confirmDelete(Map<String, dynamic> user) {
    // Navigate to the confirm delete view with the user data.
    Get.toNamed('/confirm_delete', arguments: user);
  }
}
