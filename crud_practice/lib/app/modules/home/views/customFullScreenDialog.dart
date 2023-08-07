import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

class CustomFullScreenDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
          child: Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          onWillPop: () => Future.value(false)),
      barrierDismissible: false,
      barrierColor: AppColors.primaryColor.withOpacity(.3),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
