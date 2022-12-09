import 'package:country_app/app/pages/home/home_page.dart';
import 'package:get/get.dart';

import '../app/pages/home/bindings/home_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
