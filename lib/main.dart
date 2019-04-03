import 'package:flutter/material.dart';

// pages
import './pages/Home/index.dart';
import './pages/Translate/index.dart';
import './pages/Message/index.dart';
import './pages/Person/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Cnode',
      theme: ThemeData(primaryColor: Colors.redAccent),
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

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _currentIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
      //     BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('收藏')),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
      //   ],
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     mainAxisSize: MainAxisSize.max,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.home),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.person),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
