import 'package:banking_app/componets/SegmentSeparator.dart';
import 'package:banking_app/componets/SlideUpAnimation.dart';
import 'package:banking_app/componets/fl_chart.dart';
import 'package:banking_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:banking_app/componets/customizedTapBar.dart';
import 'componets/animatedList.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic>
    with SingleTickerProviderStateMixin<Statistic>, SlideUpMixin {
  @override
  void initState() {
    super.initState();
    initSlide();
  }

  @override
  void dispose() {
    super.dispose();
    disposeSlide();
  }

  final List<Map<String, String>> contacts = [
    {
      "name": "Ethan",
      "image": "assets/images/Rectangle 379.png",
      "amount": "-\$100",
    },
    {
      "name": "Ann",
      "image": "assets/images/Rectangle 380.png",
      "amount": "+\$24",
    },
    {
      "name": "Daniel",
      "image": "assets/images/Rectangle 381.png",
      "amount": "-\$60",
    },
    {
      "name": "Jack",
      "image": "assets/images/Rectangle 382.png",
      "amount": "+\$60",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      bottomNavigationBar: TapBar(initialIndex: 2),
      appBar: AppBar(
        backgroundColor: Color(0xffF9F9F9),
        actionsPadding: EdgeInsets.symmetric(horizontal: 30),
        title: Text(
          "Statistic",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Widgets()));
            },
            child: SvgPicture.asset(
              "assets/icons/category0.svg",
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
      body: Stack(
        // margin: EdgeInsets.only(top: 16),
        children: [
          Column(
            children: [
              SizedBox(height: 8),
              SegmentSeparator(
                segments: const ['week', 'month', 'year'],
                initialIndex: 0,
              ),
              SizedBox(height: 30),
              FlChart(),

              SizedBox(height: 16),
              Animatedlist(),
            ],
          ),
        ],
      ),
    );
  }
}
