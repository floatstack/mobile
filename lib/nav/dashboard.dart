import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/color.dart';
import '../helper/logics.dart';
import '../widgets/customs.dart';
import '../widgets/txt.dart';
import 'card_withdrawal.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _State();
}

class _State extends State<Dashboard> {

  String balance  = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: devH(context, 4),
              padding: padA(16),
              decoration: BoxDecoration(color: primary),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/ham.svg'),
                    Txt(title: 'Total Amount (₦)', size: 14, weight: FontWeight.w400, color: Colors.white),
                    bH(16),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Txt(align: TextAlign.end, title: balance, size: 48, color: Colors.white, weight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 4,
                children: [
                  Expanded(
                    child: Row(
                      spacing: 4,
                      children: [
                        homeCard('Deposit', 'deposit'),
                        homeCard('Withdrawal', 'withdraw'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      spacing: 4,
                      children: [
                        homeCard('Bill Payment', 'bill'),
                        homeCard('More', 'more'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  homeCard(title, icon){
    return Expanded(
      child: GestureDetector(
        onTap: (){
          if(icon == 'withdraw'){
            open(context, CardWithdrawal());
          }
        },
        child: Container(
          color: Colors.white,
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/$icon.svg'),
              Txt(title: title),
            ],
          ),
        ),
      ),
    );
  }

}
