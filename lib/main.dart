import 'package:banking_app/Wallet.dart';
import 'package:banking_app/cards.dart';
import 'package:banking_app/sendMoney.dart';
import 'package:banking_app/settings.dart';
import 'package:banking_app/statistic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(fontFamily: "Mont"),
      routes: {
        "Cards": (context) => Cards(),
        "statistic": (context) => Statistic(),
        "Wallet": (context) => Wallet(),
        "settings": (context) => settings(),
        "sendMoney": (context) => Sendmoney(),
      },

      home: Wallet(),
    );
  }
}
