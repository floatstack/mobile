import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';

import '../helper/color.dart';
import '../widgets/customs.dart';
import '../widgets/txt.dart';

class NotificationDetails extends StatefulWidget {

  const NotificationDetails({super.key});

  @override
  State<NotificationDetails> createState() => _State();

}

class _State extends State<NotificationDetails> {

  final box = GetStorage();

  String location = '';
  String routeCode = '';

  @override
  void initState() {
    box.write('navigation', '');
    location = box.read('location');
    routeCode = box.read('routeCode');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          spacing: 4,
          children: [
            bH(12),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SvgPicture.asset('assets/icons/ham.svg'),
                ),
                Center(child: Txt(title: 'Notification', size: 22, color: primary)),
              ],
            ),
            bH(12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: [
                    Container(
                      padding: padA(16),
                      decoration: conDeco(16, yellow0),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: conDeco(8, yellow),
                            padding: padA(8),
                            child: SvgPicture.asset('assets/icons/warn.svg'),
                          ),
                          bH(4),
                          Txt(title: 'Low Float Alert', size: 14, weight: FontWeight.w700),
                          Txt(title: 'Your float balance is getting low. \nPlease top up soon to avoid failed transactions', size: 14, weight: FontWeight.w400),
                          Txt(title: 'Collect cash at:', size: 14, weight: FontWeight.w400, color: yellow),
                          Txt(title: 'Atm Location: $location', size: 14, color: Colors.black),
                          Txt(title: 'Route Code: $routeCode', size: 14, color: Colors.black),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
