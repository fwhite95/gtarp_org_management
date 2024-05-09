import 'package:models/models.dart';
import 'package:org_management/src/apis/theft_api.dart';

class TheftRepository {
  final TheftAPI _theftAPI;

  TheftRepository({
    required TheftAPI theftAPI,
  }) : _theftAPI = theftAPI;

  Future<TheftActivity> getTheftActivity(String orgId, String crimeId) async {
    final document = await _theftAPI.getTheftData(orgId, crimeId);
    final theftActivity =
        TheftActivity.fromJson(document.data() as Map<String, dynamic>);
    return theftActivity;
  }

  Future<List<TheftActivity>> getTheftActivities(String orgId) async {
    final query = await _theftAPI.getAllTheftData(orgId);
    final list = query.docs;
    List<TheftActivity> listTheftActivity = [];
    for (final q in list) {
      listTheftActivity.add(TheftActivity.fromJson(q.data()));
    }
    return listTheftActivity;
  }

  Future createTheftActivity(String orgId, TheftActivity theftActivity) async {
    await _theftAPI.createTheftData(orgId, theftActivity);
  }

  Future updateTheftActivity(String orgId, TheftActivity theftActivity) async {
    await _theftAPI.updateTheftData(orgId, theftActivity);
  }

  Future deleteTheftActivity(String orgId, String id) async {
    await _theftAPI.deleteTheftData(orgId, id);
  }
}
