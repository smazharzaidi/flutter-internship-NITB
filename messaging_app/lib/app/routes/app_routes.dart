part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const MESSAGE = _Paths.MESSAGE; 
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const MESSAGE = '/message'; 
}
