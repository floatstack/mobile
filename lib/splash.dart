import 'package:flutter/material.dart';
import 'package:stack/helper/logics.dart';

import 'dashboard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _State();
}

class _State extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      bootSuccess();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/logo.png', width: MediaQuery.of(context).size.width / 5, height: MediaQuery.of(context).size.width / 5)),
    );
  }

  bootSuccess() {
    openX(context,  Dashboard());
  }
}
