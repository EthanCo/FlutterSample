import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "http://pic163.nipic.com/file/20180421/7092831_140036752037_2.jpg",
    "https://b-ssl.duitang.com/uploads/item/201507/07/20150707100822_zCAFQ.jpeg",
    "http://img.mp.itc.cn/upload/20160428/b52be3dc215d4ecd844bf922be46f278_th.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
                //滑动监听
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollNotification &&
                      scrollNotification.depth == 0) {
                    //滚动并且列表滑动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  //padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(
                        title: Text("haha"),
                      ),
                    )
                  ],
                ))));
  }

  void _onScroll(double offset) {
    print("offset:$offset");
  }
}
