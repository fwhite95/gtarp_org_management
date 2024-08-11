import 'package:models/models.dart';

class WeedStatsData {
  static List<Map<String, dynamic>> getSellersList(
      List<WeedActivity> weedActivities) {
    List<Map<String, dynamic>> sellersList = [];
    for (final a in weedActivities) {
      // {name: '' ,'money': 6700, 'bags': 100}
      if (a.activity == 'Weed: Sell') {
        Map<String, dynamic> seller = {};
        final percentage =
            (a.percentage == '' ? 0 : double.parse(a.percentage)) / 100;

        seller.addAll({
          'name': a.name,
          'money': int.parse(a.money),
          'bags': int.parse(a.bags),
          'percentage': percentage,
          'kickback': int.parse(a.money) * percentage,
        });

        if (sellersList.any((o) => o['name'] == seller['name'])) {
          for (int i = 0; i < sellersList.length; i++) {
            if (sellersList[i]['name'] == seller['name']) {
              sellersList[i]['money'] += seller['money'];
              sellersList[i]['bags'] += seller['bags'];
            }
          }
        } else {
          sellersList.add(seller);
        }
      }
    }
    return sellersList;
  }

  static List<Map<String, dynamic>> getGrowersList(
      List<WeedActivity> weedActivities, int totalSold) {
    List<Map<String, dynamic>> growersList = [];
    for (final a in weedActivities) {
      // {name: '' ,'money': 6700, 'bags': 100}
      if (a.activity == 'Weed: Grow') {
        Map<String, dynamic> grower = {};
        final percentage =
            (a.percentage == '' ? 0 : double.parse(a.percentage)) / 100;
        print('3');
        grower.addAll({
          'name': a.name,
          'bags': int.parse(a.bags),
          'percentage': percentage,
          'kickback': (totalSold * percentage),
        });
        print('4');

        if (growersList.any((o) => o['name'] == grower['name'])) {
          for (int i = 0; i < growersList.length; i++) {
            if (growersList[i]['name'] == grower['name']) {
              growersList[i]['bags'] += grower['bags'];
            }
          }
        } else {
          growersList.add(grower);
        }
      }
    }
    return growersList;
  }

  static Map<String, dynamic> getWeedMoneyData(
      List<Map<String, dynamic>> sellersList,
      List<Map<String, dynamic>> growersList) {
    Map<String, dynamic> moneyData = {
      'dirtyEarned': 0,
      'totalKickback': 0,
      'totalGrossProfit': 0,
    };

    for (final s in sellersList) {
      moneyData['dirtyEarned'] += s['money'];
      moneyData['totalKickback'] += s['kickback'];
    }

    for (final g in growersList) {
      moneyData['totalKickback'] += g['kickback'];
    }

    moneyData['totalGrossProfit'] =
        moneyData['dirtyEarned'] - moneyData['totalKickback'];

    return moneyData;
  }
}
