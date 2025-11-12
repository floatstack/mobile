import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/color.dart';
import '../helper/logics.dart';
import '../widgets/customs.dart';
import '../widgets/txt.dart';
import 'card_pin.dart';

class CardAccountType extends StatefulWidget {
  final int amount;
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
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  bH(8),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SvgPicture.asset('assets/icons/ham.svg'),
                      ),
                      Center(child: Txt(title: 'Card Withdrawal', size: 22, color: primary)),
                    ],
                  ),
                  bH(8),
                  Container(
                    width: double.infinity,
                    color: gray,
                    height: 1,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: padS(12, 16),
                      child: Txt(title: 'Select Account Type', size: 16, weight: FontWeight.w400),
                    ),
                  ),
                  bH(12),
                ],
              ),
            ),
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
