import 'package:flutter/material.dart';

//基于ListView实现水平和垂直方式滚动的列表
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ListViewRefreshPage(),
    );
  }
}

//下拉刷新
class ListViewRefreshPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewRefreshPageState();
  }
}

class _ListViewRefreshPageState extends State<ListViewRefreshPage> {
  final String title = "下拉刷新";

//城市列表数组
  List<String> CITY_NAMES = [
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
        child: new ListView(
          children: _buildList(),
        ),
        onRefresh: _handleRefresh,
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    //延迟两秒
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      CITY_NAMES = CITY_NAMES.reversed.toList();
    });
  }

  //执行刷新
  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}