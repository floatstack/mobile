import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stack/widgets/customs.dart';
import 'package:stack/widgets/txt.dart';

import '../helper/color.dart';

class CardWithdrawal extends StatefulWidget {
  const CardWithdrawal({super.key});

  @override
  State<CardWithdrawal> createState() => _State();
}

class _State extends State<CardWithdrawal> {

  String v = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
            children: [
              appHeader('Enter Amount'),
              bH(12),
              Container(
                margin: padA(8),
                padding: padA(12),
                decoration: conDeco(8, Colors.white),
                width: double.infinity,
                height: devH(context, 4),
                child: Txt(title: v, size: 24, color: primary),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          children: [
                            bW(8),
                            Expanded(
                              child: Column(
                                spacing: 12,
                                children: [
                                  Row(
                                    spacing: 8,
                                    children: [
                                      numKey('1'),
                                      numKey('2'),
                                      numKey('3'),
                                    ],
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      numKey('4'),
                                      numKey('5'),
                                      numKey('6'),
                                    ],
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      numKey('7'),
                                      numKey('8'),
                                      numKey('9'),
                                    ],
                                  ),
                                  Row(
                                    spacing: 8,
                                    children: [
                                      numKey('C'),
                                      numKey('0'),
                                      numKey('000'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              spacing: 16,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(v.isNotEmpty){
                                        v = v.substring(0, v.length - 1);
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: devW(context, 4.5),
                                    height: devW(context, 2.25),
                                    decoration: conDeco(6, Colors.white),
                                    child: SvgPicture.asset('assets/icons/cancel.svg', fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Container(
                                  width: devW(context, 4.5),
                                  height: devW(context, 2.25),
                                  decoration: conDeco(6, primary),
                                  child: Center(child: Txt(title: 'ENTER', color: Colors.white, size: 16)),
                                ),
                              ],
                            ),
                            bW(8),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              bH(16),
            ],
        ),
      ),
    );
  }

  numKey(i){
    return GestureDetector(
      onTap: () {

        if(i == 'C'){
          setState(() {
            v = '';
          });
          return;
        }
        setState(() {
          v = v + i.toString();
        });

      },
      child: Container(
        width: devW(context, 4.5),
        height: devW(context, 4.5),
        padding: padS(24, 16),
        decoration: conDeco(8, Colors.white),
        child: Center(child: Txt(title: i, size: 28, weight: FontWeight.w300)),
      ),
    );
  }

}
