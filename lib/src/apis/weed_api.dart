import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';

abstract class IWeedAPI {
  Future createWeedData(String orgId, WeedActivity weedActivity);
  Future getAllWeedData(String orgId);
  Future getWeedData(String orgId, String id);
  Future updateWeedData(String orgId, WeedActivity weedActivity);
  Future deleteWeedData(String orgId, String id);
}

class WeedAPI implements IWeedAPI {
  final FirebaseFirestore _firestore;
  WeedAPI({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future createWeedData(String orgId, WeedActivity weedActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Weed')
          .doc(weedActivity.crimeId)
          .set(weedActivity.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future deleteWeedData(String orgId, String id) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Weed')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllWeedData(
      String orgId) async {
    final collection = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Weed')
        .get();

    return collection;
  }

  @override
  Future<DocumentSnapshot> getWeedData(String orgId, String id) async {
    final document = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Weed')
        .doc(id);
    return document.get();
  }

  @override
  Future updateWeedData(String orgId, WeedActivity weedActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Weed')
          .doc(weedActivity.crimeId)
          .update(weedActivity.toJson());
    } catch (e) {
      print(e);
    }
  }
}
