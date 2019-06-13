import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController(
      initialPage: 0
    );

    return Scaffold(
      body: Center(
        child: Text("首页"),
      ),
    );
  }
}
