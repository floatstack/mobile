import 'package:flutter/material.dart';

open(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

openX(context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}

formatAmount(n) {
  String am = '';
  String j = n.toString();
  if (j != '' && j != 'null') {
    if (j == '0') {
      am = j;
    } else {
      j = j.toString().replaceAll(' ', '').replaceAll(',', '');
      if (j.toString().contains('.')) {
        j = (double.parse(j)).toStringAsFixed(2);
        if (j.toString().split('.')[0].length == 4) {
          String a = j.toString().substring(0, 1);
          String b = j.toString().substring(1, 4);
          am = '$a,$b.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 5) {
          String a = j.toString().substring(0, 2);
          String b = j.toString().substring(2, 5);
          am = '$a,$b.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 6) {
          String a = j.toString().substring(0, 3);
          String b = j.toString().substring(3, 6);
          am = '$a,$b.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 7) {
          String a = j.toString().substring(0, 1);
          String b = j.toString().substring(1, 4);
          String c = j.toString().substring(4, 7);
          am = '$a,$b,$c.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 8) {
          String a = j.toString().substring(0, 3);
          String b = j.toString().substring(3, 5);
          String c = j.toString().substring(5, 8);
          am = '$a,$b,$c.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 9) {
          String a = j.toString().substring(0, 3);
          String b = j.toString().substring(3, 6);
          String c = j.toString().substring(6, 9);
          am = '$a,$b,$c.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 10) {
          String a = j.toString().substring(0, 1);
          String b = j.toString().substring(1, 4);
          String c = j.toString().substring(4, 7);
          String d = j.toString().substring(7, 10);
          am = '$a,$b,$c,$d.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 11) {
          String a = j.toString().substring(0, 2);
          String b = j.toString().substring(2, 5);
          String c = j.toString().substring(5, 8);
          String d = j.toString().substring(8, 11);
          am = '$a,$b,$c,$d.${j.toString().split('.')[1]}';
        } else if (j.toString().split('.')[0].length == 12) {
          String a = j.toString().substring(0, 3);
          String b = j.toString().substring(3, 6);
          String c = j.toString().substring(6, 9);
          String d = j.toString().substring(9, 12);
          am = '$a,$b,$c,$d.${j.toString().split('.')[1]}';
        } else {
          am = j;
        }
      } else {
        if (j.toString().length == 4) {
          String a = j.toString().substring(0, 1);
          String b = j.toString().substring(1, 4);
          am = '$a,$b';
        } else if (j.toString().length == 5) {
          String a = j.toString().substring(0, 2);
          String b = j.toString().substring(2, 5);
          am = '$a,$b';
        } else if (j.toString().length == 6) {
          String a = j.toString().substring(0, 3);
          String b = j.toString().substring(3, 6);
          am = '$a,$b';
        } else if (j.toString().length == 7) {
          String a = j.toString().substring(0, 1);
          String b = j.toString().substring(1, 4);
          String c = j.toString().substring(4, 7);
          am = '$a,$b,$c';
        } else if (j.toString().length == 8) {
          String a = j.toString().substring(0, 2);
          String b = j.toString().substring(2, 5);
          String c = j.toString().substring(5, 8);
          am = '$a,$b,$c';
        } else if (j.toString().length == 9) {
          String a = j.toString().substring(0, 3);
          String b = j.toString().substring(3, 6);
          String c = j.toString().substring(6, 9);
          am = '$a,$b,$c';
        } else if (j.toString().length == 10) {
          String a = j.toString().substring(0, 1);
          String b = j.toString().substring(1, 4);
          String c = j.toString().substring(4, 7);
          String d = j.toString().substring(7, 10);
          am = '$a,$b,$c,$d';
        } else if (j.toString().length == 11) {
          String a = j.toString().substring(0, 2);
          String b = j.toString().substring(2, 5);
          String c = j.toString().substring(5, 8);
          String d = j.toString().substring(8, 11);
          am = '$a,$b,$c,$d';
        } else if (j.toString().length == 12) {
          String a = j.toString().substring(0, 3);
          String b = j.toString().substring(3, 6);
          String c = j.toString().substring(6, 9);
          String d = j.toString().substring(9, 12);
          am = '$a,$b,$c,$d';
        } else {
          am = j;
        }
      }
    }
  } else {
    am = '0';
  }

  return am;
}

