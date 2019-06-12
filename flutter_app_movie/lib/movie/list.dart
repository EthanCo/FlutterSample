import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  final String mt;

  //固定写法
  //MovieList({Key key}):super(key:key)
  //@required 设置为必传项;
  MovieList({Key key,this.mt}) : super(key: key){}


  @override
  _MovieListState createState() {
    return _MovieListState();
  } //继承自有状态的控件
}

//有状态控件，必须结合一个状态管理类来实现
class _MovieListState extends State<MovieList> {
  //渲染当前这个 MovieList 控件的UI接口
  @override
  Widget build(BuildContext context) {
    return Text("这是电影列表页面------"+widget.mt);
  }
}
