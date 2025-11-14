import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'firebase_options.dart';
import 'helper/color.dart';
import 'helper/noti.dart';
import 'splash.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());

  postInit();

}

postInit() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {

    String? token = '';

    if(Platform.isIOS){

      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken != null) {
        token = await FirebaseMessaging.instance.getToken();
      }
    } else {
      token = await FirebaseMessaging.instance.getToken();
    }
    debugPrint(token);

  } catch (e, stack) {

    debugPrint(e.toString());
    debugPrint(stack.toString());

  }

  var per = await Permission.notification.status;

  if (per.isGranted) {
    await Noti.initializeNotification();
  } else if (per.isDenied) {
    await Noti.initializeNotification();
  }

  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onMessage.listen(handleMessage);
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      initialMsg(message);
    }
  });

}

handleMessage(RemoteMessage msg) async {

  try {
    await Noti.showNoti(
      title: msg.notification!.title.toString(),
      body: msg.notification!.body.toString(),
    );



    final box = GetStorage();
    if (msg.data.isNotEmpty) {
      //var js = msg.data;
      box.write('navigation', 'open');
    } else {
      box.write('navigation', '');
    }

  } catch (ex) {
    debugPrint(ex.toString());
  }

}

initialMsg(RemoteMessage msg) {}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Float Stack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
      ),
      home: Splash(),
    );
  }

}
