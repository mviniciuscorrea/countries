import 'package:cloud_firestore/cloud_firestore.dart';

class Country {
  Country();

  static const _collection = 'country';
  static const _subcountry = 'subcountry';
  static const _city = 'city';

  final _db = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCountry() async {
    var collection = await _db.collection(_collection).get();
    return collection.docs;

    // print(collection.docs.length);

    // for (var c in collection.docs) {
    //   print(c.id);
    // }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSubCountry(
      {required String country}) async {
    var collection = await _db
        .collection(_collection)
        .doc(country)
        .collection(_subcountry)
        .get();

    return collection.docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCities({
    required String country,
    required String subcountry,
  }) async {
    var collection = await _db
        .collection(_collection)
        .doc(country)
        .collection(_subcountry)
        .doc(subcountry)
        .collection(_city)
        .get();

    return collection.docs;
  }

  Future<Map<String, dynamic>?> getInfoCity({
    required String country,
    required String subcountry,
    required String city,
  }) async {
    var collection = await _db
        .collection(_collection)
        .doc(country)
        .collection(_subcountry)
        .doc(subcountry)
        .collection(_city)
        .doc(city)
        .get();

    return collection.data();
  }
}
