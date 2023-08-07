import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../views/confirm_delete_view.dart';
import '../views/create_view.dart';
import '../views/index_view.dart';
import '../views/update_view.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut(() => IndexView());
    Get.lazyPut(() => CreateView(),
        fenix: true); // Use CreateBinding for CreateView
    Get.lazyPut(() => UpdateView(),
        fenix: true); // Use UpdateBinding for UpdateView
    Get.lazyPut(() => ConfirmDeleteView(),
        fenix: true); // Use ConfirmDeleteBinding for ConfirmDeleteView
  }
}
