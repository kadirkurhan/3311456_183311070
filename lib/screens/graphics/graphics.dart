import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_programming/components/appbar/appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../components/drawer/drawer.dart';
import '../../store/main.dart';

class GraphicsScreen extends StatefulWidget {
  const GraphicsScreen({super.key});

  @override
  State<GraphicsScreen> createState() => _GraphicsScreenState();
}

class _GraphicsScreenState extends State<GraphicsScreen> {
  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();

    final List<ChartData> chartData = [
      ChartData('Kategori 1', 35),
      ChartData('Kategori 2', 20),
      ChartData('Kategori 3', 10),
      ChartData('Kategori 4', 25),
      ChartData('Kategori 5', 15),
    ];

    return Scaffold(
      appBar: AppBarComponent("Graphics", shouldLeadingShow: false),
      drawer: const DrawerMenuComponent(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SfCircularChart(
                  series: <CircularSeries>[
                    PieSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.value,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}
