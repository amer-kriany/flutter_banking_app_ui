import 'package:banking_app/componets/SwipeToPay.dart';
import 'package:banking_app/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sendmoney extends StatefulWidget {
  final Widget Image;
  const Sendmoney({super.key, required this.Image});

  @override
  State<Sendmoney> createState() => _SendmoneyState();
}

class _SendmoneyState extends State<Sendmoney> {
  Login LoginNumbers = Login();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Send Money",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Colors.black.withOpacity(0.85),
          ),
        ),

        titleSpacing: 0.1,
        actionsPadding: EdgeInsets.only(right: 30),
        actions: [SvgPicture.asset("assets/icons/scan.svg")],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                margin: EdgeInsets.only(top: 24),
                width: 354,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xffF4F2F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    widget.Image,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          "   Ann",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff3F304F),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 16),
                            SvgPicture.asset(
                              "assets/icons/bag.svg",
                              width: 20.8,
                              height: 13,
                            ),
                            SizedBox(width: 9),
                            ...List.generate(4, (i) {
                              return Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xff3F304F),
                                ),
                              );
                            }),
                            SizedBox(width: 6),
                            Text(
                              "6301",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff3F304F),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    SizedBox(width: 110),
                    SvgPicture.asset(
                      "assets/icons/drop.svg",
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),

              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  hint: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: Color(0xffEDEDED),
                            ),
                          ),
                          TextSpan(
                            text: "100",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ".0",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: Color(0xffEDEDED),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 63),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 36,
                        crossAxisSpacing: 36,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return _numbers(index + 1);
                      },
                    ),
                    SizedBox(height: 36),
                    Row(
                      children: [
                        _numbers("."),
                        SizedBox(width: 36),
                        _numbers(0),
                        SizedBox(width: 36),
                        _numbers(Icon(Icons.backspace)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SwipeToPay(),
          ],
        ),
      ),
    );
  }
}

Widget _numbers(index) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: 71,
      height: 71,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          strokeAlign: BorderSide.strokeAlignInside,
          width: 0.887,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: (index.runtimeType == Icon)
            ? Icon(
                Icons.backspace,
                size: 30.175,
                color: Colors.black.withOpacity(0.7),
              )
            : Text(
                "$index",
                style: TextStyle(
                  fontSize: 30.175,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
      ),
    ),
  );
}
