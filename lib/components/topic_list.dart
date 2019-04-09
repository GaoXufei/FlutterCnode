import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio(
  BaseOptions(baseUrl: 'https://cnodejs.org/api/v1'),
);

class ComponentTopicList extends StatefulWidget {
  final String tab; // 主题分类
  ComponentTopicList({Key key, this.tab: ''}) : super(key: key);
  @override
  _ComponentTopicList createState() => _ComponentTopicList();
}

class _ComponentTopicList extends State<ComponentTopicList>
    with AutomaticKeepAliveClientMixin {
  // 保存状态
  bool get wantKeepAlive => true;
// 定义数据列表
  List _dataList = List();
// 默认页码
  int _page = 1;
  // 是否加载数据
  bool isLoad = false;
  // 定义滚动条控制器
  ScrollController _scrollController = ScrollController();
  // 下拉刷新方法
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      // 刷新请求数据
      _refreshRequest(tab: widget.tab);
    });
  }

  /**
   * 刷新请求数据
   * 与初始请求数据不同，此方法是将请求的数据覆盖到list中
   */
  Future _refreshRequest(
      {String tab = '', int page = 1, int limit = 10}) async {
    final Response result =
        await dio.get('/topics?tab=$tab&page=$page&limit=$limit');
    if (result.statusCode == 200) {
      setState(() {
        // 将数据填充到列表中
        _dataList = result.data['data'];
        // 将加载状态更改为不加载
        isLoad = false;
      });
    }
  }

  /**
   * 加载数据方法
   */
  Future _httpRequest({String tab = '', int page = 1, int limit = 10}) async {
    final Response result =
        await dio.get('/topics?tab=$tab&page=$page&limit=$limit');
    if (result.statusCode == 200) {
      setState(() {
        // 将数据填充到列表中
        _dataList.addAll(result.data['data']);
        // 将加载状态更改为不加载
        isLoad = false;
      });
    }
  }

  // 加载更多
  void _getMore() {
    if (!isLoad) {
      // 改变加载状态为加载状态
      setState(() {
        isLoad = true;
        _page++;
      });
      // 加载数据
      _httpRequest(tab: widget.tab, page: _page);
    }
  }

  // 初始化
  @override
  void initState() {
    super.initState();
    // 初始化数据
    _httpRequest(tab: widget.tab);
    // 设置列表控制器
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMore();
      }
    });
  }

  // 卸载
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    if (_dataList.length > 0) {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        color: Colors.red,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _dataList.length + 1, // 长度加一是为了预留出加载动画
          itemBuilder: (BuildContext ctx, int i) {
            // 如果长度为length则将加载动画组件添加到最后
            return i == _dataList.length
                ? _buildListLoading()
                : _buildRow(_dataList[i]);
          },
        ),
      );
    }
    return Text('loading...');
  }

  // 列表单项
  Widget _buildRow(info) {
    final String _timer = info['create_at'];
    final String _title = info['title'];
    final String _avatarUrl = info['author']['avatar_url'];
    return ListTile(
      title: Text(_title),
      subtitle: Text(_timer),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          _avatarUrl,
        ),
      ),
    );
  }

  // 列表加载动画
  Widget _buildListLoading() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Opacity(
            opacity: 1,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('加载中...'),
          ),
        ],
      ),
    );
  }
}
