import 'package:flutter/material.dart';

class Personaltap extends StatefulWidget {
  const Personaltap({super.key});

  @override
  State<Personaltap> createState() => _PersonaltapState();
}

class _PersonaltapState extends State<Personaltap> {
   List General = [
    {"image": "assets/images/Frame 16.png", "title": "Security"},
    {"image": "assets/images/Frame 17.png", "title": "Notifications"},
    {"image": "assets/images/Frame 18.png", "title": "Google pay"},
    {"image": "assets/images/Frame 19.png", "title": "Language"},
  ];
  List Personalization = [
    {"image": "assets/images/Frame 20.png", "title": "Main screen"},
    {"image": "assets/images/Frame 21.png", "title": "Widgets"},
    {"image": "assets/images/Frame 22.png", "title": "Personal offers"},
  ];

  bool _isDarkOn = false;
  bool _isOffersOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
        
                SizedBox(height: 30),
              Text(
                "Appearence",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 354,
                height: 49,
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/Frame 15.png"),
                    SizedBox(width: 16),
                    Text(
                      "Dark theme",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(width: 160),
                    GestureDetector(
                      onTap: () => setState(() => _isDarkOn = !_isDarkOn),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: 38,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _isDarkOn
                              ? Color(0xFF62C73F)
                              : Color(0xffeeeeee5),
                        ),
                        child: AnimatedAlign(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          alignment: _isDarkOn
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
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: 30),
              Text(
                "General",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 8),
              ...List.generate(General.length, (val) {
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
                          Image.asset(General[val]["image"]),
                          SizedBox(width: 16),
                          Text(
                            General[val]["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
      
                      // SizedBox(width: 160),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 30),
              Text(
                "Personalization",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 8),
              ...List.generate(Personalization.length, (i) {
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
                          Image.asset(Personalization[i]["image"]),
                          SizedBox(width: 16),
                          Text(
                            Personalization[i]["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      (Personalization[i]["title"] == "Personal offers")
                          ? GestureDetector(
                              onTap: () =>
                                  setState(() => _isOffersOn = !_isOffersOn),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: 38,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _isOffersOn
                                      ? Color(0xFF62C73F)
                                      : Color(0xffeeeeee5),
                                ),
                                child: AnimatedAlign(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  alignment: _isOffersOn
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