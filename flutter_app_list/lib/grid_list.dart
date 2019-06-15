import 'package:flutter/material.dart';

//基于ListView实现水平和垂直方式滚动的列表
void main() => runApp(GridViewPage(""));

//网格布局
class GridViewPage extends StatelessWidget {
  final String title;
  GridViewPage(this.title);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.blueGrey),
          ),
          backgroundColor: Colors.green,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: _getGridListView(),
        ),
      ),
    );
  }

  List<Widget> _getGridListView() {
    return CITY_NAMES.map((city) => _GridItemView(city)).toList();
  }

  Widget _GridItemView(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.orange),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}