import 'package:flutter/material.dart';
import 'package:stack/widgets/customs.dart';
import 'package:stack/widgets/txt.dart';

import '../helper/color.dart';

class CardWithdrawal extends StatefulWidget {
  const CardWithdrawal({super.key});

  @override
  State<CardWithdrawal> createState() => _State();
}

class _State extends State<CardWithdrawal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
            children: [
              Txt(title: 'Card Withdrawal', size: 22, color: primary),
              bH(12),
            ],
        ),
      ),
    );

  }
}
