import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/weed_stats/weed_stats_bloc.dart';

class WeedStats extends StatelessWidget {
  const WeedStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeedStatsBloc, WeedStatsState>(
      builder: (context, state) {
        if (state.status == WeedStatsStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == WeedStatsStatus.error) {
          return const Center(
            child: Text('Error'),
          );
        }

        int maxBags = 0;
        int maxMoney = 0;

        List<ScatterSpot> data = [];
        for (final s in state.sellersList) {
          data.add(
            ScatterSpot(
              s['bags'],
              s['money'],
              dotPainter: FlDotCirclePainter(
                color: (Random().nextInt(100) % 2) != 1
                    ? Colors.blue
                    : Colors.purple,
              ),
            ),
          );
          maxBags = max(s['bags'], maxBags);
          maxMoney = max(s['money'], maxMoney);
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AspectRatio(
                aspectRatio: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: secondaryColor.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(75),
                      child: ScatterChart(
                        ScatterChartData(
                          scatterSpots: data,
                          minX: 0,
                          maxX: maxBags.toDouble() + 100,
                          minY: 0,
                          maxY: maxMoney.toDouble() + 10000,
                          scatterLabelSettings: ScatterLabelSettings(
                            showLabel: false,
                            getLabelFunction: (spotIndex, spot) =>
                                state.sellersList[spotIndex]['name'],
                          ),
                          borderData: FlBorderData(
                            show: true,
                          ),
                          gridData: const FlGridData(
                            show: false,
                          ),
                          titlesData: const FlTitlesData(
                            show: true,
                            leftTitles: AxisTitles(
                              axisNameWidget: Text('Money'),
                              sideTitles: SideTitles(
                                interval: 15000,
                                showTitles: true,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              axisNameWidget: Text('Bags'),
                              sideTitles: SideTitles(
                                interval: 100,
                                showTitles: true,
                              ),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          scatterTouchData: ScatterTouchData(
                            enabled: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<ScatterSpot> testData() {
    return [
      ScatterSpot(20, 14.5,
          dotPainter: FlDotCirclePainter(
            color:
                (Random().nextInt(100) % 2) != 2 ? Colors.blue : Colors.purple,
          )),
    ];
  }
}
