import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';


options() {
  return Options(
    sendTimeout: tm(),
    contentType: "application/json",
    validateStatus: (statusCode) {
      if (statusCode == null) {
        return false;
      }
      if (statusCode == 400 || statusCode <= 503) {
        return true;
      } else {
        return statusCode >= 200 && statusCode < 300;
      }
    },
  );
}

getBaseUrl() {
  return dotenv.env['BASE_URL'];
}

getRequest(url, {String d = ''}) async {
  Dio dio = Dio();

  dynamic js;

  bool sessionTimeout = false;

  final response = await dio
      .get(getBaseUrl() + url,
    options: options(),
  )
      .timeout(tm(), onTimeout: () {
    sessionTimeout = true;
    return d != 'no_log' ? t() : {};
  }).onError((error, stackTrace) {
    RequestOptions req = RequestOptions();
    return Response(requestOptions: req);
  });

  js = response.data;

  if (response.statusCode == 200 || response.statusCode == 201) {

    js = response.data;

  }
  else {
    try {
      String message = '';

      if(js['message'] != null){
        message = js['message'].toString();
      }
      else if(js['error'] != null){
        message = js['error'].toString();
      }

      if(js['errors'] != null){
        Map<String, String> errors = Map<String, String>.from(js['errors']);

        message = errors.entries.first.value.toString();
      }

      if(message == ''){
        if(d != 'no_log'){
          err('Unknown Error');
        }
        return '';
      } else {
        if(d != 'no_log'){
          err(message);
        }
        return '';
      }
    } catch (e) {
      if(d != 'no_log'){
        if(!sessionTimeout){
          err('Unknown App Error');
        }
      }
      return '';
    }
  }

  return js;

}

postRequest(url, d) async {
  Dio dio = Dio();

  dynamic js;

  bool sessionTimeout = false;

  final response = await dio.post(
    getBaseUrl() + url,
    data: d,
    options: options(),
  )
      .timeout(tm(), onTimeout: () {
    sessionTimeout = true;
    return t();
  }).onError((error, stackTrace) {
    RequestOptions req = RequestOptions();
    return Response(requestOptions: req);
  });

  js = response.data;

  print(js);

  if (response.statusCode == 200 || response.statusCode == 201) {

    js = response.data;

  }
  else {
    try {

      String message = '';

      if(js['message'] != null && js['message'] != ''){
        message = js['message'].toString();
      }

      else if(js['error'] != null){
        message = js['error'].toString();
      }

      if(message == ''){
        if(js['errors'] != null){
          Map<String, String> errors = Map<String, String>.from(js['errors']);

          message = errors.entries.first.value.toString();
        }
      }

      if(message == ''){
        Fluttertoast.showToast(msg: 'Unknown Error', backgroundColor: Colors.red);
        return '';
      }
      else {
        Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
        return '';
      }
    } catch (e) {
      if(!sessionTimeout){
        Fluttertoast.showToast(msg: 'System Network Error', backgroundColor: Colors.red);
      }
      return '';
    }

  }

  return js;

}

tm() {
  return const Duration(seconds: 20);
}

t() {
  err('Network timeout, please retry...');
}

err(sms) {
  Fluttertoast.showToast(
    msg: sms,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 14,
  );
}
