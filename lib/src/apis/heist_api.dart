import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';

abstract class IHeistAPI {
  Future createHeistData(String orgId, HeistActivity heistActivity);
  Future getAllHeistData(String orgId);
  Future getHeistData(String orgId, String id);
  Future updateHeistData(String orgId, HeistActivity heistActivity);
  Future deleteHeistData(String orgId, String id);
}

class HeistAPI implements IHeistAPI {
  final FirebaseFirestore _firestore;
  HeistAPI({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future createHeistData(String orgId, HeistActivity heistActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Heist')
          .doc(heistActivity.crimeId)
          .set(heistActivity.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future deleteHeistData(String orgId, String id) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Heist')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllHeistData(
      String orgId) async {
    final collection = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Heist')
        .get();

    return collection;
  }

  @override
  Future<DocumentSnapshot> getHeistData(String orgId, String id) async {
    final document = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Heist')
        .doc(id);
    return document.get();
  }

  @override
  Future updateHeistData(String orgId, HeistActivity heistActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Heist')
          .doc(heistActivity.crimeId)
          .update(heistActivity.toJson());
    } catch (e) {
      print(e);
    }
  }
}
