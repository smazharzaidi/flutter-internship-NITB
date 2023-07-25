import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/main_screen.dart'; // Import the MainScreen

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL =
      Routes.MAIN_SCREEN; // Change this to point to MAIN_SCREEN

  static final routes = [
    GetPage(
      name: _Paths.MAIN_SCREEN, // Add MainScreen route
      page: () => MainScreen(), // The MainScreen widget
      binding:
          HomeBinding(), // If you have a separate binding for MainScreen, use it here
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
  ];
}
