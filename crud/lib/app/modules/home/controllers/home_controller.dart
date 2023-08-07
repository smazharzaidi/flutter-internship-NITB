import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  RxList<Map<String, dynamic>> users = RxList<Map<String, dynamic>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final QuerySnapshot snapshot = await _usersCollection.get();
      users.value = snapshot.docs
          .map((doc) => doc.data())
          .toList()
          .cast<Map<String, dynamic>>();
    } catch (e) {
      // Handle errors, show error message, etc.
      print('Error fetching users: $e');
    }
  }

  Future<void> createUser(String name, String cnic, File image) async {
    try {
      // Upload the image to Firebase Storage
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images/${DateTime.now()}.png');
      await storageRef.putFile(image);

      // Get the image URL
      final String imageUrl = await storageRef.getDownloadURL();

      // Create a new user in Firestore
      await _usersCollection.add({
        'name': name,
        'cnic': cnic,
        'image_url': imageUrl,
      });

      // Update the local users list
      fetchUsers();
    } catch (e) {
      // Handle errors, show error message, etc.
      print('Error creating user: $e');
    }
  }

  Future<void> updateUser(String userId, String name, String cnic) async {
    try {
      // Update the user in Firestore
      await _usersCollection.doc(userId).update({
        'name': name,
        'cnic': cnic,
      });

      // Update the local users list
      fetchUsers();
    } catch (e) {
      // Handle errors, show error message, etc.
      print('Error updating user: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      // Delete the user's image from Firebase Storage (optional, if you want to delete the image)
      final DocumentSnapshot userSnapshot =
          await _usersCollection.doc(userId).get();

      final Map<String, dynamic>? userData =
          userSnapshot.data() as Map<String, dynamic>?;

      if (userData != null) {
        final String? imageUrl = userData['image_url'];
        if (imageUrl != null && imageUrl.isNotEmpty) {
          await FirebaseStorage.instance.refFromURL(imageUrl).delete();
        }
      }

      // Delete the user from Firestore
      await _usersCollection.doc(userId).delete();

      // Update the local users list
      fetchUsers();
    } catch (e) {
      // Handle errors, show error message, etc.
      print('Error deleting user: $e');
    }
  }
}
