import 'package:models/models.dart';
import 'package:org_management/src/apis/weed_api.dart';

class WeedRepository {
  final WeedAPI _weedAPI;

  WeedRepository({
    required WeedAPI weedAPI,
  }) : _weedAPI = weedAPI;

  Future<WeedActivity> getWeedActivity(String orgId, String crimeId) async {
    final document = await _weedAPI.getWeedData(orgId, crimeId);
    final weedActivity =
        WeedActivity.fromJson(document.data() as Map<String, dynamic>);
    return weedActivity;
  }

  Future<List<WeedActivity>> getWeedActivities(String orgId) async {
    final query = await _weedAPI.getAllWeedData(orgId);
    final list = query.docs;
    List<WeedActivity> listWeedActivity = [];
    for (final q in list) {
      listWeedActivity.add(WeedActivity.fromJson(q.data()));
    }
    return listWeedActivity;
  }

  Future createWeedActivity(String orgId, WeedActivity weedActivity) async {
    await _weedAPI.createWeedData(orgId, weedActivity);
  }

  Future updateWeedActivity(String orgId, WeedActivity weedActivity) async {
    await _weedAPI.updateWeedData(orgId, weedActivity);
  }

  Future deleteWeedActivity(String orgId, String id) async {
    await _weedAPI.deleteWeedData(orgId, id);
  }
}
