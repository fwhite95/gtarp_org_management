import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';

abstract class ITheftAPI {
  Future createTheftData(String orgId, TheftActivity theftActivity);
  Future getAllTheftData(String orgId);
  Future getTheftData(String orgId, String id);
  Future updateTheftData(String orgId, TheftActivity theftActivity);
  Future deleteTheftData(String orgId, String id);
}

class TheftAPI implements ITheftAPI {
  final FirebaseFirestore _firestore;
  TheftAPI({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future createTheftData(String orgId, TheftActivity theftActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Theft')
          .doc(theftActivity.crimeId)
          .set(theftActivity.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future deleteTheftData(String orgId, String id) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Theft')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllTheftData(
      String orgId) async {
    final collection = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Theft')
        .get();

    return collection;
  }

  @override
  Future<DocumentSnapshot> getTheftData(String orgId, String id) async {
    final document = _firestore
        .collection('organization')
        .doc(orgId)
        .collection('Theft')
        .doc(id);
    return document.get();
  }

  @override
  Future updateTheftData(String orgId, TheftActivity theftActivity) async {
    try {
      await _firestore
          .collection('organization')
          .doc(orgId)
          .collection('Theft')
          .doc(theftActivity.crimeId)
          .update(theftActivity.toJson());
    } catch (e) {
      print(e);
    }
  }
}
