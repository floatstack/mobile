import 'package:flutter/material.dart';

import '../helper/color.dart';
import '../helper/logics.dart';
import '../widgets/customs.dart';
import '../widgets/txt.dart';
import 'card_pin.dart';

class CardAccountType extends StatefulWidget {
  final num amount;
  const CardAccountType({super.key, required this.amount});

  @override
  State<CardAccountType> createState() => _State();
}

class _State extends State<CardAccountType> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          spacing: 4,
          children: [
            appHeader('Select Account Type'),
            bH(12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: [
                    typeCard('Default'),
                    typeCard('Savings'),
                    typeCard('Current'),
                    typeCard('Credit'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  typeCard(type){
    return GestureDetector(
      onTap: () => open(context, CardPIN(amount: widget.amount, type: type)),
      child: Card(
        margin: padS(0, 16),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Container(
          width: double.infinity,
          padding: padS(devH(context, 24), 16),
          decoration: conDeco(8, Colors.white),
          child: Center(child: Txt(title: type, size: 18, weight: FontWeight.w400)),
        ),
      ),
    );
  }
}
