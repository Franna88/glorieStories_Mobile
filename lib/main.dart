import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:html';

import 'package:glorie_stories_mobile/LoginPage/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB1kZS4az3MnUqmcr6tQPNmxwJB7PUx-9w",
          authDomain: "glorie-stories.firebaseapp.com",
          projectId: "glorie-stories",
          storageBucket: "glorie-stories.appspot.com",
          messagingSenderId: "409865047782",
          appId: "1:409865047782:web:86c685f88c8fcd587fb527"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
  document.documentElement?.style.setProperty('overflow', 'hidden');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Glory Stories',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ResponciveRoute());
    //home: TrackInfo());
  }
}

class ResponciveRoute extends StatelessWidget {
  const ResponciveRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return const Login();
      },
    );
  }
}
