import 'package:flutter/material.dart';

class PageMessage extends StatefulWidget {
  @override
  _PageMessageState createState() => _PageMessageState();
}

class _PageMessageState extends State<PageMessage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('message'),
      ),
    );
  }
}
