import 'package:flutter/material.dart';

open(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

openX(context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}