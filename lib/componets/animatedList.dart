import 'package:flutter/material.dart';

class Animatedlist extends StatefulWidget {
  const Animatedlist({super.key});

  @override
  State<Animatedlist> createState() => _AnimatedlistState();
}

class _AnimatedlistState extends State<Animatedlist>
    with SingleTickerProviderStateMixin {
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
  late AnimationController _controller;
  late Animation<Offset> _sliderAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _sliderAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.reverse();
    _controller.dispose();
    super.dispose();
  }

  DateTime now = DateTime.now();
  late String time =
      "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _sliderAnimation,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 296,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffffffff),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 190, vertical: 8),
              child: Container(width: 8, height: 3, color: Color(0xffF0F0F0)),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Today",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      contacts[0]["image"]!,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(contacts[0]["name"]!),
                      subtitle: Text(time),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "${contacts[0]["amount"]}",
                    style: TextStyle(
                      color: (contacts[0]["amount"]![0] == "+")
                          ? Color(0xff62C73F)
                          : Color(0xffE64646),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.info_outline),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Yesterday",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 2),

            ...List.generate(3, (val) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        contacts[val + 1]["image"]!,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(contacts[val + 1]["name"]!),
                        subtitle: Text(time),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "${contacts[val]["amount"]}",
                      style: TextStyle(
                        color: (contacts[val + 1]["amount"]![0] == "+")
                            ? Color(0xff62C73F)
                            : Color(0xffE64646),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.info_outline),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
