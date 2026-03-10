import 'package:banking_app/cardsTap.dart';
import 'package:banking_app/componets/SegmentSeparator.dart';
import 'package:banking_app/componets/customizedTapBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:banking_app/personalTap.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TapBar(initialIndex: 3),

      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    "assets/images/head.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "Welcome back,",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff413250).withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "John",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff413250),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 115),

                SvgPicture.asset(
                  "assets/icons/notification.svg",
                  width: 24,
                  height: 29,
                ),
              ],
            ),
            SizedBox(height: 30),
            SegmentSeparator(
              segments: ['personal', 'cards'],
              shadowWidth: 177.0, // ✅ نص العرض الكلي
              initialIndex: _currentIndex,
              onSegmentChanged: (index) {
                setState(() => _currentIndex = index);
              },
            ),
            SizedBox(
              height: 600,
              child: IndexedStack(
                index: _currentIndex,
                children: [Personaltap(), Cardstap()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
}
