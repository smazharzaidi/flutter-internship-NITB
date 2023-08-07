import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/customFullScreenDialog.dart';
import '../views/customSnackBar.dart';
import '../../../data/models/user_model.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, cnicController;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<User> users = RxList<User>([]);
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    cnicController = TextEditingController();
    collectionReference = firebaseFirestore.collection("users");
    users.bindStream(getAllUsers());
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

  String? ValidateCnic(String value) {
    if (value.isEmpty) {
      return "CNIC cannot be empty";
    }
    return null;
  }

  void saveUpdateUser(String name, String cnic, String docId, int addEditFlag) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();
      collectionReference.add({'name': name, 'cnic': cnic}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "User Added",
          message: "User Added Successfully",
        );
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
        );
      });
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      collectionReference
          .doc(docId)
          .update({'name': name, 'cnic': cnic}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "User Updated",
          message: "User updated successfully",
        );
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
        );
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    cnicController.dispose();
  }

  void clearEditingControllers() {
    nameController.clear();
    cnicController.clear();
  }

  Stream<List<User>> getAllUsers() => collectionReference
      .snapshots()
      .map((query) => query.docs.map((item) => User.fromMap(item)).toList());
  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
        context: Get.context,
        title: "User Deleted",
        message: "User deleted successfully",
      );
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
        context: Get.context,
        title: "Error",
        message: "Something went wrong",
      );
    });
  }
}
