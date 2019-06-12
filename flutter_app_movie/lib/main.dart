import 'package:flutter/material.dart';

//导入 电影列表页面
import 'movie/list.dart';

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
          primarySwatch: Colors.purple,
        ),
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //在Flutter中，每个控件都是一个类
    return DefaultTabController(
        length: 3, //与bottomNavigationBar tab的个数保持一致
        child: Scaffold(
          appBar: AppBar(
            title: Text("电影列表"),
            centerTitle: true, //标题居中
            actions: <Widget>[
              //右侧按钮
              IconButton(icon: Icon(Icons.search), onPressed: () {})
            ],
          ), //ActionBar
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(0), //取消List默认的Padding，已解决状态栏是灰色的问题
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: Text("fenghenyu@163.com"),
                  accountName: Text("Heiko"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.52z.com/upload/news/image/20180213/20180213064456_56208.jpg"),
                  ),
                  //美化当前控件
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, //撑满
                          image: NetworkImage(
                              "http://www.liulongbin.top:3005/images/bg1.jpg"))),
                ),
                ListTile(title: Text("用户反馈"), trailing: Icon(Icons.feedback)),
                ListTile(title: Text("系统设置"), trailing: Icon(Icons.settings)),
                ListTile(title: Text("我要发布"), trailing: Icon(Icons.send)),
                Divider(/*color:Colors.grey*/), //分割线
                ListTile(title: Text("注销"), trailing: Icon(Icons.exit_to_app)),
              ],
            ),
          ), //侧边栏
          bottomNavigationBar: Container(
            //Container相当于网页开发中的div，用来添加背景颜色
            decoration: BoxDecoration(color: Colors.black),
            height: 50, //一般bottomNavigationBar高度都是50
            child: TabBar(
              labelStyle: TextStyle(height: 0, fontSize: 10), //让文本不占高度，字体设为10
              tabs: <Widget>[
                Tab(text: "正在热映", icon: Icon(Icons.movie_filter)),
                Tab(text: "即将上映", icon: Icon(Icons.movie_creation)),
                Tab(text: "Top250", icon: Icon(Icons.local_movies)),
              ],
            ), //底部的TabBar，需要提供一个Controller，比如DefaultTabController,
          ),
          body: TabBarView(children: <Widget>[
            MovieList(mt:"in_theaters"),
            MovieList(mt:"coming_soon"),
            MovieList(mt:"top250"),
          ]),
        ));
  }
}
