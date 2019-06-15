import 'package:flutter/material.dart';

//基于ListView实现水平和垂直方式滚动的列表
void main() => runApp(ListViewPage());

class ListViewPage extends StatelessWidget {
  //城市列表数组
  static const CITY_NAMES = [
    '北京',
    '上海',
    '广州',
    '深圳',
    '杭州',
    '苏州',
    '成都',
    '武汉',
    '郑州',
    '长沙',
    '云南',
    '长春',
    '黑龙江'
  ];
  final String title = "Basic List";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal, //横或者竖
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}