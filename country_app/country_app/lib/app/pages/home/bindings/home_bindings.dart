import 'package:country_app/app/data/firebase/country.dart';
import 'package:country_app/app/pages/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(country: Country()));
  }
}
