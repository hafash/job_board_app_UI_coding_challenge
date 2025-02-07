import 'package:flutter/material.dart';

import 'pages/landing_page.dart';

void main() {
  runApp(JobBoardApp());
}

class JobBoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Board App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LandingPage(),
    );
  }
}
