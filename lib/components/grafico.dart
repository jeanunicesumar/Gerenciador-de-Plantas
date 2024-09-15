import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Grafico extends StatelessWidget {
  final Map<String, int> quantityByValue;

  const Grafico(this.quantityByValue, {super.key});

  @override
  Widget build(BuildContext context) {
    if (quantityByValue.isEmpty) {
      return PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 1,
              color: Colors.grey[800],
              radius: 50,
              title: '',
            ),
          ],
          borderData: FlBorderData(show: false),
          sectionsSpace: 3,
          centerSpaceRadius: 40,
        ),
      );
    }

    return PieChart(
      PieChartData(
        sections: quantityByValue.entries.map((entry) {
          final tipo = entry.key;
          final contagem = entry.value;

          return PieChartSectionData(
            value: contagem.toDouble(),
            color: _getRandomGreenColor(),
            title: tipo,
            radius: 50,
            titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
          );
        }).toList(),
        borderData: FlBorderData(show: false),
        sectionsSpace: 3,
        centerSpaceRadius: 40,
      ),
    );
  }

  Color _getRandomGreenColor() {
    final random = Random();
    int red, green, blue;

    red = random.nextInt(200);
    green = random.nextInt(200);
    blue = random.nextInt(200);

    return Color.fromARGB(255, red, green, blue);
  }
}
