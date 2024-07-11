import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/presentations/maintab_bar_page.dart';

void main() {
  runApp(FlutterELearningApp());
}

class FlutterELearningApp extends StatelessWidget {
 String validPin ="123456";
  FlutterELearningApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter eLearning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      MainTabBarPage(),
      debugShowCheckedModeBanner:false,
      //  OTPPage(phoneNumber: '',),
    );
  }
}

