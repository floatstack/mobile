import 'package:flutter/material.dart';

import 'helper/color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _State();
}

class _State extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primary,
              ),
            )
          ],
        ),
      ),
    );


  }
}
