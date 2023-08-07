// controllers/app_controller.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/main_app_model.dart';

class AppController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(
      BuildContext context, String name, String cnic) async {
    try {
      UserModel newUser = UserModel(name: name, cnic: cnic);

      return users
          .add({
            'name': newUser.name,
            'cnic': newUser.cnic,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (error) {
      print('Error while creating user: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create user. Please try again.'),
        ),
      );
    }
  }
}
