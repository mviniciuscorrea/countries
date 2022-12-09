import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_app/app/data/firebase/country.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Country _country;

  String _countryNow = '';
  String _subCountry = '';

  RxInt step = 0.obs;
  RxBool loading = false.obs;

  RxMap<String, dynamic> infoCity = <String, dynamic>{}.obs;

  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> data =
      <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  HomeController({required Country country}) : _country = country;

  void loadData(String id) async {
    if (id.trim().isNotEmpty) {
      step.value++;

      switch (step.value) {
        case 1:
          loadSubCountry(country: id);
          break;
        case 2:
          loadCities(subCountry: id);
          break;
        case 3:
          loadInfoCity(city: id);
          break;
        default:
          loadContry();
      }
    }
  }

  returnList() {
    step.value--;

    switch (step.value) {
      case 1:
        loadSubCountry(country: _countryNow);
        break;
      case 2:
        loadCities(subCountry: _subCountry);
        break;
      default:
        loadContry();
    }
  }

  void loadContry() async {
    loading.value = true;
    step.value = 0;
    data.value = await _country.getCountry();
    loading.value = false;
  }

  void loadSubCountry({required String country}) async {
    loading.value = true;
    _countryNow = country;
    data.value = await _country.getSubCountry(
      country: country,
    );
    loading.value = false;
  }

  void loadCities({required String subCountry}) async {
    loading.value = true;
    _subCountry = subCountry;

    data.value = await _country.getCities(
      country: _countryNow,
      subcountry: subCountry,
    );
    loading.value = false;
  }

  void loadInfoCity({required String city}) async {
    loading.value = true;
    infoCity.value = await _country.getInfoCity(
          country: _countryNow,
          subcountry: _subCountry,
          city: city,
        ) ??
        {};
    loading.value = false;
  }
}
