import 'package:models/models.dart';
import 'package:org_management/src/apis/heist_api.dart';

class HeistRepository {
  final HeistAPI _heistAPI;

  HeistRepository({
    required HeistAPI heistAPI,
  }) : _heistAPI = heistAPI;

  Future<HeistActivity> getHeistActivity(String orgId, String crimeId) async {
    final document = await _heistAPI.getHeistData(orgId, crimeId);
    final heistActivity =
        HeistActivity.fromJson(document.data() as Map<String, dynamic>);
    return heistActivity;
  }

  Future<List<HeistActivity>> getHeistActivities(String orgId) async {
    final query = await _heistAPI.getAllHeistData(orgId);
    final list = query.docs;
    List<HeistActivity> listHeistActivity = [];
    for (final q in list) {
      listHeistActivity.add(HeistActivity.fromJson(q.data()));
    }
    return listHeistActivity;
  }

  Future createHeistActivity(String orgId, HeistActivity heistActivity) async {
    await _heistAPI.createHeistData(orgId, heistActivity);
  }

  Future updateHeistActivity(String orgId, HeistActivity heistActivity) async {
    await _heistAPI.updateHeistData(orgId, heistActivity);
  }

  Future deleteHeistActivity(String orgId, String id) async {
    await _heistAPI.deleteHeistData(orgId, id);
  }
}
