import 'package:models/models.dart';
import 'package:org_management/src/apis/cleaning_api.dart';

class CleaningRepository {
  final CleaningAPI _cleaningAPI;

  CleaningRepository({
    required CleaningAPI cleaningAPI,
  }) : _cleaningAPI = cleaningAPI;

  Future<CleaningActivity> getCleaningActivity(String orgId, String crimeId) async {
    final document = await _cleaningAPI.getCleaningData(orgId, crimeId);
    final cleaningActivity =
        CleaningActivity.fromJson(document.data() as Map<String, dynamic>);
    return cleaningActivity;
  }

  Future<List<CleaningActivity>> getCleaningActivities(String orgId) async {
    final query = await _cleaningAPI.getAllCleaningData(orgId);
    final list = query.docs;
    List<CleaningActivity> listCleaningActivity = [];
    for (final q in list) {
      listCleaningActivity.add(CleaningActivity.fromJson(q.data()));
    }
    return listCleaningActivity;
  }

  Future createCleaningActivity(String orgId, CleaningActivity cleaningActivity) async {
    await _cleaningAPI.createCleaningData(orgId, cleaningActivity);
  }

  Future updateCleaningActivity(String orgId, CleaningActivity cleaningActivity) async {
    await _cleaningAPI.updateCleaningData(orgId, cleaningActivity);
  }

  Future deleteCleaningActivity(String orgId, String id) async {
    await _cleaningAPI.deleteCleaningData(orgId, id);
  }
}
