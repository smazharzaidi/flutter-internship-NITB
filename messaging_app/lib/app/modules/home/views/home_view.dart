import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/message_controller.dart';

class HomeView extends StatelessWidget {
  final MessageController _messageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chats')),
      body: GestureDetector(
        onTap: () {
          Get.toNamed('/message');
        },
        child: Card(
          child: ListTile(
            title: Text('Group Chat'),
          ),
        ),
      ),
    );
  }
}
