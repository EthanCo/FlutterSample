import 'package:flutter/material.dart';

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
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //在Flutter中，每个控件都是一个类
    return Scaffold(
      appBar: AppBar(
        title: Text("电影列表"),
        centerTitle: true, //标题居中
        actions: <Widget>[
          //右侧按钮
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
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
      ),
    );
  }
}
