import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class MovieList extends StatefulWidget {
  final String mt;

  //固定写法
  //MovieList({Key key}):super(key:key)
  //@required 设置为必传项;
  MovieList({Key key, this.mt}) : super(key: key) {}


  @override
  _MovieListState createState() {
    return _MovieListState();
  } //继承自有状态的控件
}

//有状态控件，必须结合一个状态管理类来实现
class _MovieListState extends State<MovieList> {
  //默认显示第一条数据
  int page = 1;

//每页显示的数据条数
  int pagesize = 10;

//电影列表数据
  var mlist = [];

//总数据条数，实现分页数据
  var total = 0;

  //控件被创建的时候，会执行initState
  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  //渲染当前这个 MovieList 控件的UI接口
  @override
  Widget build(BuildContext context) {
    //return Text("这是电影列表页面------${widget.mt}--- ${mlist.length}");
    //buider表示循环渲染
    return ListView.builder(
        itemCount: mlist.length,
        itemBuilder: (BuildContext ctx,int i){
          return Text(i.toString());
        }
    );
  }

  //获取电影列表
  getMovieList() async {
    //js中有模板字符串，dio类似
    //偏移量的计算公式 (page - 1) * pagesize
    int offset = (page - 1) * pagesize;
    var response = await dio.get(
        "http://www.liulongbin.top:3005/api/v2/movie/${widget
            .mt}?start=$offset&count=$pagesize");
    //服务器返回的数据
    var result = response.data;
    //{count: 10, start: 0, total: 20, subjects: [{rating: {max: 10, average: 7.6, stars: 40, min: 0}, genres: [动作, 科幻, 冒险], title: 阿丽塔：战斗天使, casts: [{alt: https://movie.douban.com/celebrity/1342762/, avatars: {small: https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1501911452.02.webp, large: https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1501911452.02.webp, medium: https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1501911452.02.webp}, name: 罗莎·萨拉查, id: 1342762}, {alt: https://movie.douban.com/celebrity/1054405/, avatars: {small: https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p26974.webp, large: https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p26974.webp, medium: https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p26974.webp}, name: 克里斯托弗·沃尔兹, id: 1054405}, {alt: https://movie.douban.com/celebrity/1399007/, avatars: {small: https://img3.doubanio.com/view
    print(result);

    //今后只有为私有数据赋值，都需要把赋值的操作，放到setState函数中
    setState(() {
      //通过dio返回的数据，必须使用[]来访问
      mlist = result["subjects"];
      total = result["total"];
    });
  }
}
