import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Widgets extends StatefulWidget {
  const Widgets({super.key});

  @override
  State<Widgets> createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
             Image.asset("assets/images/blur2.png"),
          
          Container(color: Colors.black.withOpacity(0.01)),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                child: Row(
                  spacing: 190,
                  children: [
                    Text(
                      "Widgets",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(
                context,
              ).pushNamedAndRemoveUntil("statistic", (route) => false);
                      },
                      child: SvgPicture.asset(
                        "assets/icons/category.svg",
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                width: 354,
                height: 194,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 32,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 210,
                      children: [
                        Text(
                          "Statistics",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.85),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black.withOpacity(0.85),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 15,
                      children: [
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF4F4F4),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xffffffff),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Row(
                              spacing: 7,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffFB6EFE),
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
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF4F4F4),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
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
                                    color: Color(0xffB36EFE),
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  width: 14,
                                  height: 14,
                                ),
                                Text("Food"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffF4F4F4),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
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
                                    color: Color(0xffFE6E71),
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
                            border: Border.all(
                              color: Color(0xffF4F4F4),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
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
                                    color: Color(0xffFEB36E),
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
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFF9B72F5), // purple
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4695A), // red-orange
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFF57BB0), // pink
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFFABB7A), // peach
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13),
                width: 354,
                height: 194,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 32,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 210,
                      children: [
                        Text(
                          "Statistics",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.85),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black.withOpacity(0.85),
                        ),
                      ],
                    ),

                    // SizedBox(height: 0),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Image.asset("assets/images/Graph1.png"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(top: 2),
                              padding: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffF4F4F4),
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
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
                                        color: Color(0xffB36EFE),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      width: 14,
                                      height: 14,
                                    ),
                                    Text("Food"),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(right: 7),
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffF4F4F4),
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
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
                                            color: Color(0xffFEB36E),
                                            borderRadius: BorderRadius.circular(
                                              60,
                                            ),
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
                                    border: Border.all(
                                      color: Color(0xffF4F4F4),
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Color(0xffffffff),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Row(
                                      spacing: 7,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffFB6EFE),
                                            borderRadius: BorderRadius.circular(
                                              60,
                                            ),
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
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffF4F4F4),
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
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
                                        color: Color(0xffFE6E71),
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
                          ],
                        ),
                        SizedBox(height: 18),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 183,
                height: 38,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Color(0xffA3A3A3),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Remove all widgets",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 209),
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: 276,
                    height: 44,
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Color(0x000ff999),
                      ),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Text(
                      "add widgets on Your main screen",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
