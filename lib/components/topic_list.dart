import 'package:flutter/material.dart';

class ComponentTopicList extends StatefulWidget {
  @override
  _ComponentTopicList createState() => _ComponentTopicList();
}

class _ComponentTopicList extends State<ComponentTopicList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  //
  final _dataList = List.generate(100, (int i) => 'test $i');

  @override
  Widget build(BuildContext ctx) {
    return ListView.builder(
      itemCount: _dataList.length,
      itemExtent: 40,
      itemBuilder: (BuildContext ctx, int i) {
        return ListTile(
          title: Text(
            _dataList[i],
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }
}
