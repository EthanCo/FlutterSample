import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({Key key,@required this.id,@required this.title}):super(key:key);

  final String id;

  final String title;

  @override
  _MovieDetailState createState() {
    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Text("id:${widget.id} title:${widget.title}");
  }
}
