import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

class CustomSnackBar {
  static void showSnackBar({
    required BuildContext? context,
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          title,
          style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 16, color: AppColors.secondaryColor),
        ),
        borderRadius: 8,
        margin: EdgeInsets.all(16));
  }
}
