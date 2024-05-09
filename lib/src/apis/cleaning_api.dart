import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';

abstract class ICleaningAPI {
  Future createCleaningData(String orgId, CleaningActivity cleaningActivity);
  Future getAllCleaningData(String orgId);
  Future getCleaningData(String orgId, String id);
  Future updateCleaningData(String orgId, CleaningActivity cleaningActivity);
  Future deleteCleaningData(String orgId, String id);
}

class CleaningAPI implements ICleaningAPI {
  final FirebaseFirestore _firestore;
  CleaningAPI({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future createCleaningData(
      String orgId, CleaningActivity cleaningActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Cleaning')
          .doc(cleaningActivity.crimeId)
          .set(cleaningActivity.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future deleteCleaningData(String orgId, String id) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Cleaning')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllCleaningData(
      String orgId) async {
    final collection = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Cleaning')
        .get();

    return collection;
  }

  @override
  Future<DocumentSnapshot> getCleaningData(String orgId, String id) async {
    final document = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Cleaning')
        .doc(id);
    return document.get();
  }

  @override
  Future updateCleaningData(
      String orgId, CleaningActivity cleaningActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Cleaning')
          .doc(cleaningActivity.crimeId)
          .update(cleaningActivity.toJson());
    } catch (e) {
      print(e);
    }
  }
}
