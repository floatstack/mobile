import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stack/helper/logics.dart';
import 'package:stack/nav/notificationDetails.dart';

import '../helper/api_request.dart';
import '../helper/color.dart';
import '../widgets/customs.dart';
import '../widgets/txt.dart';
import 'dashboard.dart';

class CardPIN extends StatefulWidget {
  final num amount;
  final String type;
  const CardPIN({super.key, required this.amount, required this.type});

  @override
  State<CardPIN> createState() => _State();
}

class _State extends State<CardPIN> {

  String pin = '';

  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: AbsorbPointer(
        absorbing: false,
        child: SafeArea(
          child: Column(
            spacing: 4,
            children: [
              appHeader('Enter Card Pin'),
              bH(12),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pinInput(pin.isNotEmpty ? true : false),
                  pinInput(pin.length >= 2 ? true : false),
                  pinInput(pin.length >= 3 ? true : false),
                  pinInput(pin.length >= 4 ? true : false),
                ],
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
                                      numKey('.'),
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
                                      if(pin.isNotEmpty){
                                        pin = pin.substring(0, pin.length - 1);
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
                                GestureDetector(
                                  onTap: () {
                                    if(pin.length == 4){
                                      sendRequest();
                                    } else {
                                      err('Enter a valid pin');
                                    }
                                  },
                                  child: Container(
                                    width: devW(context, 4.5),
                                    height: devW(context, 2.25),
                                    decoration: conDeco(6, primary),
                                    child: Center(child: Txt(title: 'ENTER', color: Colors.white, size: 16)),
                                  ),
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
      ),
    );
  }

  sendRequest() async {
    showLoader();
    var payload = jsonEncode(<String, dynamic>{
      'pin': pin,
      'agent_id': 'GTB-AG-0001',
      'type': widget.type.toLowerCase(),
      'tx_type': 'withdrawal',
      'balance_after': 0,
      'amount': widget.amount,
    });

    var js = await postRequest('simulate/transaction', payload);

    if (js != '') {
      try {
        if (js['status'].toString().toLowerCase() == 'true') {

          var j = js['data'];

          final box = GetStorage();
          box.write('balance', j['new_balance']);

          if(j['classification'] == 'LOW_E_FLOAT'){
            box.write('location', j['alert']['atm_location']);
            box.write('routeCode', j['alert']['code']);
            showAlert(true);
          } else {
            showAlert(false);
          }

        }
        else {
          if (js['message'] != null) {
            err(js['message']);
          } else {
            err('Withdrawal failed');
          }
          close();
        }
      } catch (ex) {
        err('Withdrawal process failed');
        close();
      }
    } else {
      close();
    }



  }

  numKey(i){
    return GestureDetector(
      onTap: () {

        setState(() {

          if(i == '.'){
            pin = '';
            return;
          }

          if(i == 'C'){
            pin = '';
            return;
          }

          if(pin.length == 4){
            return;
          }

          pin = pin + i.toString();

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

  pinInput(set) {
    return Container(
        width: devW(context, 6),
        height: devW(context, 6),
        decoration: conDecor(8, gray2, 1, Colors.white),
        child: Center(child: Txt(title: set ? '*' : '', font: 'i', size: 24))
    );
  }

  showLoader() {
    showDialog(
      context: context,
      builder:
          (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            insetPadding: padS(24, 8),
            contentPadding: padA(16),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            content: Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(
                  color: primary,
                ),
                Txt(title: 'Processing Transaction...'),
              ],
            ),
          );
        },
      ),
    );
  }

  showAlert(floatCheck) {
    close();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              backgroundColor: Colors.white,
              insetPadding: padS(24, 8),
              contentPadding: padA(16),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: InkWell(
                  //     onTap: () => Navigator.pop(context),
                  //     child: Padding(padding: padA(4), child: SvgPicture.asset('assets/icons/cancel.svg')),
                  //   ),
                  // ),
                  bH(16),
                  Container(
                      padding: padA(8),
                      decoration: conDeco(8, primary),
                      child: SvgPicture.asset('assets/icons/alert.svg')),
                  bH(16),
                  Txt(
                    align: TextAlign.center,
                    title: 'Withdrawal Successful',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  bH(4),
                  Txt(
                    align: TextAlign.center,
                    title: 'Your transaction completed successfully.',
                    size: 12,
                    weight: FontWeight.w400,
                  ),
                  bH(16),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: primary,
                        minimumSize: Size.fromHeight(devH(context, 16)),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        if(floatCheck){
                          openX(context, NotificationDetails());
                        } else {
                          openX(context, Dashboard());
                        }
                      }, child: Txt(title: 'Print Receipt', size: 12, color: Colors.white)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  close(){
    Navigator.pop(context);
  }


}
