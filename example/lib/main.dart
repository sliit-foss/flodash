import 'package:enhanced_http/enhanced_http.dart';
import 'package:enhanced_http_example/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
  EnhancedHttp.initialize(baseURL: Constants.apiBaseURL);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced HTTP Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
