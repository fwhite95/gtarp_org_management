import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';

abstract class IMoonshineAPI {
  Future createMoonshineData(String orgId, MoonshineActivity moonshineActivity);
  Future getAllMoonshineData(String orgId);
  Future getMoonshineData(String orgId, String id);
  Future updateMoonshineData(String orgId, MoonshineActivity moonshineActivity);
  Future deleteMoonshineData(String orgId, String id);
}

class MoonshineAPI implements IMoonshineAPI {
  final FirebaseFirestore _firestore;
  MoonshineAPI({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future createMoonshineData(
      String orgId, MoonshineActivity moonshineActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Moonshine')
          .doc(moonshineActivity.crimeId)
          .set(moonshineActivity.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future deleteMoonshineData(String orgId, String id) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Moonshine')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future getAllMoonshineData(String orgId) async {
    final collection = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Moonshine')
        .get();

    return collection;
  }

  @override
  Future getMoonshineData(String orgId, String id) async {
    final document = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Moonshine')
        .doc(id);
    return document.get();
  }

  @override
  Future updateMoonshineData(
      String orgId, MoonshineActivity moonshineActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Moonshine')
          .doc(moonshineActivity.crimeId)
          .update(moonshineActivity.toJson());
    } catch (e) {
      print(e);
    }
  }
}
