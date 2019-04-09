import 'package:flutter/material.dart';

// pages
import './pages/Home/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Cnode',
      theme: ThemeData(primaryColor: Colors.red),
      home: PageContainer(),
    );
  }
}

class PageContainer extends StatefulWidget {
  _PageContainer createState() => _PageContainer();
}

class _PageContainer extends State<PageContainer> {
  // int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageHome(),
    );
  }
}
