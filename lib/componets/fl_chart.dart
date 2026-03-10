import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FlChart extends StatefulWidget {
  const FlChart({super.key});

  @override
  State<FlChart> createState() => _FlChartState();
}

class _FlChartState extends State<FlChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF9F9F9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 200,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 50, // this makes the hole
                sectionsSpace: 3,
                sections: [
                  PieChartSectionData(
                    value: 30,
                    color: Color(0xffA049FF), // purple
                    radius: 30,
                    showTitle: false,
                  ),
                  PieChartSectionData(
                    value: 25,
                    color: Color(0xffD3D3D3), // light purple
                    radius: 30,
                    showTitle: false,
                  ),
                  PieChartSectionData(
                    value: 10,
                    color: Color(0xffE4E4E4), // light purple
                    radius: 30,
                    showTitle: false,
                  ),
                  PieChartSectionData(
                    value: 35,
                    color: Color(0xffEEEEEE), // light gray
                    radius: 30,
                    showTitle: false,
                  ),
                ],
              ),
            ),
          ),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$659',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '.47',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Text(
            'you spent 10% more than last week',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          SizedBox(height: 24),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffFFFFFF),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 7,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffA24DFF),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          width: 14,
                          height: 14,
                        ),
                        Text("Shopping"),
                        Text("|"),
                        Text("\$223"),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffFFFFFF),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 7,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffD3D3D3),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          width: 14,
                          height: 14,
                        ),
                        Text("Transfers"),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffFFFFFF),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 7,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffD3D3D3),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          width: 14,
                          height: 14,
                        ),
                        Text("Other"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
