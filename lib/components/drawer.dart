import 'package:flutter/material.dart';

class ComponentDrawer extends StatefulWidget {
  @override
  _ComponentDrawerState createState() => _ComponentDrawerState();
}

class _ComponentDrawerState extends State<ComponentDrawer>
    with AutomaticKeepAliveClientMixin {
  bool _isLogin = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _userInfoWidget(),
          _drawerItem(),
          _loginBar(),
        ],
      ),
    );
  }

  Widget _userInfoWidget() {
    if (!_isLogin) {
      return DrawerHeader(
        margin: EdgeInsets.only(bottom: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
            Text('未登录'),
          ],
        ),
      );
    }
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.only(bottom: 0.0),
      accountName: Text('生如夏花'),
      accountEmail: Text('m18047170938@163.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4160285545,785331896&fm=26&gp=0.jpg',
        ),
      ),
    );
  }

  Widget _drawerItem() {
    if (!_isLogin) {
      return Container();
    }
    return Expanded(
      flex: 1,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('我的收藏'),
              leading: Icon(Icons.book),
            ),
            ListTile(
              title: Text('我的主题'),
              leading: Icon(Icons.dns),
            ),
            ListTile(
              title: Text('我的回复'),
              leading: Icon(Icons.toll),
            ),
            ListTile(
              title: Text('我的消息'),
              leading: Icon(Icons.message),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginBar() {
    if (!_isLogin) {
      return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                hintText: '号码',
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              width: 300.0,
              child: RaisedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _isLogin = true;
                  });
                },
              ),
            ),
          ],
        ),
      );
      ;
    }
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: <Widget>[
            Divider(),
            ListTile(
              title: Text('设置'),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('退出登录'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                setState(() {
                  _isLogin = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
