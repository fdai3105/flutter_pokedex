import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/models.dart';

class WidgetStatNumber extends StatelessWidget {
  final List<Stat> stats;

  const WidgetStatNumber({
    Key key,
    @required this.stats,
  }) : super(key: key);

  List<Widget> _buildStats() {
    return stats.map((e) {
      return Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              e.stat.name,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            e.baseStat.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: e.baseStat / 100,
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: e.baseStat <= 50 ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10),
          ),
        ],
      ).marginOnly(bottom: 20);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildStats());
  }
}
