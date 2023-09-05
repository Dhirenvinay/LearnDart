import 'package:flutter/material.dart';
import 'package:uiassignment/home..dart';
import 'model/dummy_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
       // primarySwatch: Colors.white,
      ),
      home: const HomeScreen(data: alltopics,intro: introduction),
    );
  }
}

