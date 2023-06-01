/**
 * @Author: Your name
 * @Date:   2023-05-21 20:34:04
 * @Last Modified by:   Your name
 * @Last Modified time: 2023-05-21 20:34:17
 */
class ChartData {
  ChartData(this.x, this.y, this.size);
  final String x;
  final double y;
  final String size;
}

final List<ChartData> DataMap = [
  ChartData('USA', 10, '70%'),
  ChartData('China', 11, '60%'),
  ChartData('Russia', 9, '52%'),
  ChartData('Germany', 10, '40%'),
];
