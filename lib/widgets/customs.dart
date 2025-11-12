import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/color.dart';
import 'txt.dart';

bH(sz) {
  double a1 = sz.toDouble();
  return SizedBox(height: a1);
}

bW(sz) {
  double a1 = sz.toDouble();
  return SizedBox(width: a1);
}

conDecor(r, c, b, col) {
  double r1 = r.toDouble();
  double b1 = b.toDouble();
  return BoxDecoration(color: col, borderRadius: BorderRadius.circular(r1), border: Border.all(color: c, width: b1));
}

conDeco(r, col) {
  double r1 = r.toDouble();
  return BoxDecoration(color: col, borderRadius: BorderRadius.circular(r1));
}

padA(i) {
  double a = i.toDouble();
  return EdgeInsets.all(a);
}

padS(t, l) {
  double ver = t.toDouble();
  double hor = l.toDouble();
  return EdgeInsets.only(top: ver, bottom: ver, left: hor, right: hor);
}

devW(c, i) {
  return MediaQuery.of(c).size.width / i;

}

devH(c, i) {
  return MediaQuery.of(c).size.height / i;
}

appHeader(sub) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        bH(12),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SvgPicture.asset('assets/icons/ham.svg'),
            ),
            Center(child: Txt(title: 'Card Withdrawal', size: 22, color: primary)),
          ],
        ),
        bH(12),
        Container(
          width: double.infinity,
          color: gray,
          height: 1,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: padS(12, 16),
            child: Txt(title: sub, size: 16, weight: FontWeight.w400),
          ),
        ),
        bH(12),
      ],
    ),
  );
}





