import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/create_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/index_view.dart';
import '../modules/home/views/update_view.dart';
import '../modules/home/views/confirm_delete_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.HOME_VIEW, // add this
    //   page: () => HomeView(), // make sure you've defined HomeView
    //   binding:
    //       HomeBinding(), // change the binding if HomeView uses a different controller
    // ),
    GetPage(
      name: Routes.CREATE,
      page: () => CreateView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.UPDATE,
      page: () => UpdateView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CONFIRM_DELETE,
      page: () => ConfirmDeleteView(),
      binding: HomeBinding(),
    ),
  ];
}
