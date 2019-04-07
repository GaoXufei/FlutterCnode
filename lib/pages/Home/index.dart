import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// components
import '../../components/topic_list.dart';
import '../../components/drawer.dart';

// pages
import '../Person/index.dart';

// 实例化Dio
Dio dio = new Dio();

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
    with SingleTickerProviderStateMixin {
  // tabController
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      drawer: ComponentDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) {
            return IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
            );
          },
        ),
        title: Text('TOPICS'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true, // 是否可滑动
          indicatorColor: Colors.white, // 下显线颜色
          indicatorSize: TabBarIndicatorSize.label, // 下显线类型 根据文字 / 根据容器
          indicatorWeight: 1.0, // 下显线宽度
          tabs: <Widget>[
            Tab(text: '全部'),
            Tab(text: '精华'),
            Tab(text: '分享'),
            Tab(text: '问答'),
            Tab(text: '招聘'),
            Tab(text: '客户端测试'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.red,
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return PagePerson();
            }),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ComponentTopicList(),
          ComponentTopicList(tab: 'ask'),
          Text('1'),
          Text('1'),
          Text('1'),
          Text('1'),
        ],
      ),
    );
  }
}
