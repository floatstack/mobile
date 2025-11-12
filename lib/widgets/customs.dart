import 'package:flutter/material.dart';

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





