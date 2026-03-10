import 'package:flutter/material.dart';

class Cardstap extends StatefulWidget {
  const Cardstap({super.key});

  @override
  State<Cardstap> createState() => _CardstapState();
}

class _CardstapState extends State<Cardstap> {
  List Actions = [
    {"image": "assets/images/Frame 23.png", "title": "Freeze physical card"},
    {"image": "assets/images/Frame 24.png", "title": "Disable contactless"},
    {"image": "assets/images/Frame 25.png", "title": "Disable magstripe"},
    {"image": "assets/images/Frame 26.png", "title": "QR Code"},
  ];
  bool _isFreezeOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(height: 12),
          Image.asset("assets/images/card.png"),

          Text(
            "Actions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 8),
          ...List.generate(Actions.length, (i) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 354,
              height: 49,
              decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(Actions[i]["image"]),
                      SizedBox(width: 16),
                      Text(
                        Actions[i]["title"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  (Actions[i]["title"] == "Freeze physical card")
                      ? GestureDetector(
                          onTap: () =>
                              setState(() => _isFreezeOn = !_isFreezeOn),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: 38,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _isFreezeOn
                                  ? Color(0xFF62C73F)
                                  : Color(0xffeeeeee5),
                            ),
                            child: AnimatedAlign(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              alignment: _isFreezeOn
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 1,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
