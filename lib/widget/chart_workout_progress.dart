import 'package:fitness_app_ui/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> gradientColors = [primary,secondary];

LineChartData workoutProgressData() {
  return LineChartData(
    gridData: FlGridData(
      getDrawingVerticalLine: (value) {
      return FlLine(
          color: Colors.transparent,
          strokeWidth: 0.1,
        );
      }, 
    getDrawingHorizontalLine: (value) {
      return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 0.1,
        );
      }
    ),   
    titlesData: FlTitlesData(
      show: true,
      topTitles: AxisTitles(sideTitles: SideTitles(
        showTitles: false,
      ),),
       bottomTitles: AxisTitles(sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTitlesWidget: bottomTitleWidgets,
        interval: 8,
      ),),
      leftTitles:  AxisTitles(sideTitles: SideTitles(
        showTitles: false,
        reservedSize: 28,
        interval: 12,
      ),),

     rightTitles: AxisTitles(sideTitles: SideTitles(

        showTitles: true,
       getTitlesWidget:rightTitleWidgets,
        reservedSize: 28,
        interval: 12,
      ))
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          const FlSpot(0, 3),
          const FlSpot(2.6, 2),
          const FlSpot(4.9, 5),
          const FlSpot(6.8, 3.1),
          const FlSpot(8, 4),
          const FlSpot(9.5, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,

        gradient: LinearGradient(colors: gradientColors,),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          const FlSpot(0, 1.5),
          const FlSpot(2.5, 1),
          const FlSpot(3, 5),
          const FlSpot(5, 2),
          const FlSpot(7, 4),
          const FlSpot(8, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,
        gradient: LinearGradient(colors: [thirdColor.withOpacity(0.5),primary],),
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ],
  );

}
Widget bottomTitleWidgets(double value, TitleMeta meta){
  const style = TextStyle(
      fontSize: 10
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('Mon',style: style,);
      break;
    case 3:
      text = const Text('Tue',style: style,);
      break;
    case 5:
    text = const Text( 'Wed',style: style,);
    break;
    case 7:
      text = const Text( 'Thu',style: style,);
      break;
    case 9:
      text = const Text( 'Fri',style: style,);
      break;
    case 11:
      text = const Text( 'Sat',style: style,);
      break;
    default:
      text = const Text( '',style: style,);
      break;
  }
  return  SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
Widget rightTitleWidgets(double value, TitleMeta meta){
  const style =  TextStyle(
      fontSize: 10
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '0%';
      break;
    case 2:
      text = '20%';
      break;
    case 3:
    text = '60%';
    break;
    case 4:
      text = '80%';
      break;
    case 5:
      text = '100%';
      break;
    default:
     return Container();
  }
  return  Text(text, style: style, textAlign: TextAlign.left);
}
