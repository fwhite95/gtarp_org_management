import 'package:models/models.dart';
import 'package:org_management/src/apis/moonshine_api.dart';

class MoonshineRepository {
  final MoonshineAPI _moonshineAPI;

  MoonshineRepository({
    required MoonshineAPI moonshineAPI,
  }) : _moonshineAPI = moonshineAPI;

  Future<MoonshineActivity> getMoonshineActivity(
      String orgId, String crimeId) async {
    final document = await _moonshineAPI.getMoonshineData(orgId, crimeId);
    final moonshineActivity =
        MoonshineActivity.fromJson(document.data() as Map<String, dynamic>);
    return moonshineActivity;
  }

  Future<List<MoonshineActivity>> getMoonshineActivities(String orgId) async {
    final query = await _moonshineAPI.getAllMoonshineData(orgId);
    final list = query.docs;
    List<MoonshineActivity> listMoonshineActivity = [];
    for (final q in list) {
      listMoonshineActivity.add(MoonshineActivity.fromJson(q.data()));
    }
    return listMoonshineActivity;
  }

  Future<List<MoonshineActivity>> getMoonshineActivitiesPayWeek(
      String orgId) async {
    final query = await _moonshineAPI.getMoonshinePayWeekData(orgId);
    final list = query.docs;
    List<MoonshineActivity> listMoonshineActivity = [];
    for (final q in list) {
      listMoonshineActivity.add(MoonshineActivity.fromJson(q.data()));
    }
    return listMoonshineActivity;
  }

  Future createMoonshineActivity(
      String orgId, MoonshineActivity moonshineActivity) async {
    await _moonshineAPI.createMoonshineData(orgId, moonshineActivity);
  }

  Future updateMoonshineActivity(
      String orgId, MoonshineActivity moonshineActivity) async {
    await _moonshineAPI.updateMoonshineData(orgId, moonshineActivity);
  }

  Future deleteMoonshineActivity(String orgId, String id) async {
    await _moonshineAPI.deleteMoonshineData(orgId, id);
  }
}
