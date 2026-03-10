import 'package:banking_app/componets/SlideUpAnimation.dart';
import 'package:banking_app/componets/customizedTapBar.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet>
    with SingleTickerProviderStateMixin, SlideUpMixin {
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
  void initState() {
    super.initState();
    initSlide();
  }

  @override
  void dispose() {
    super.dispose();
    disposeSlide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TapBar(initialIndex: 0),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cards",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.black.withOpacity(0.85),
                      fontWeight: FontWeight.w800,
                      // fontFamily: "Mont",
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.lock_outline, size: 29),
                      SizedBox(width: 25),
                      Icon(Icons.search_outlined, size: 29),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("Cards");
                },
                child: Container(
                  width: 354,
                  height: 222,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(
                    "assets/images/card.png",
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Send again",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.85),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(4, (val) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("sendMoney");
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              contacts[val]["image"]!,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(contacts[val]["name"]!),
                      ],
                    );
                  }),
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent actions",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.85),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),

                  ...List.generate(4, (val) {
                    return Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              contacts[val]["image"]!,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(contacts[val]["name"]!),
                              subtitle: Text("Yesterday"),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            "${contacts[val]["amount"]}",
                            style: TextStyle(
                              color: (contacts[val]["amount"]![0] == "+")
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
            ],
          ),
        ),
      ),
    );
  }
}
