import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';

abstract class IOrganizatonAPI {
  Future createOrganizationData(Organization org);
  Future getOrganizationData(String uid);
  Future updateOrganizationData(Organization org);
  Future deleteOrganizationData();
}

class OrganizationAPI implements IOrganizatonAPI {
  final FirebaseFirestore _firestore;
  OrganizationAPI({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future createOrganizationData(Organization org) async {
    try {
      await _firestore.collection('organization').doc(org.id).set(org.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future deleteOrganizationData() {
    // TODO: implement deleteOrganizationData
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot> getOrganizationData(String uid) async {
    DocumentReference<Map<String, dynamic>> document;
    try {
      document = _firestore.collection('organization').doc(uid);
      return document.get();
    } catch (e) {
      print('getOrganizationData API: $e');
      rethrow;
    }
  }

  @override
  Future updateOrganizationData(Organization org) async {
    try {
      await _firestore
          .collection('organization')
          .doc(org.id)
          .update(org.toJson());
    } catch (e) {
      print(e);
    }
  }
}
