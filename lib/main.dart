import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:transformerPageView/contentpage.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    IndexController ic = IndexController();

    loadMore() {
      setState(() {
        datas.addAll(<DataModel>[
          DataModel(
              imageUrl:
                  'https://i.pinimg.com/564x/62/46/77/62467756928b64c3f425eb8cf4fda3e0.jpg',
              title: 'Page 0${datas.length + 1}'),
          DataModel(
              imageUrl:
                  'https://www.setaswall.com/wp-content/uploads/2017/09/320x480-Wallpaper-240.jpg',
              title: 'Page 0${datas.length + 2}'),
          DataModel(
              imageUrl:
                  'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              title: 'Page 0${datas.length + 3}'),
          DataModel(
              imageUrl:
                  'https://i.pinimg.com/236x/9b/6b/75/9b6b75f886b6fab68d2301f79e7eb042.jpg',
              title: 'Page 0${datas.length + 4}'),
        ]);
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: NotificationListener<ScrollNotification>(
                child: TransformerPageView(
                  loop: false,
                  controller: ic,
                  itemCount: datas.length,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (index) {
                    if (index == datas.length - 1) {
                      loadMore();
                    }
                  },
                  itemBuilder: (context, index) {
                    return ContentPage(
                        imageUrl: datas[index].imageUrl,
                        title: datas[index].title);
                  },
                ),
                onNotification: (ScrollNotification noti) {
                  if (noti is OverscrollNotification) {
                    setState(() {
                      viRefresh = -(noti.overscroll);
                      viRefresh = viRefresh.clamp(0.0, 1.0);
                      viRotate++;
                      showRefresh = true;
                    });
                  }

                  if (noti is ScrollEndNotification) {
                    if (noti.metrics.pixels == 0) {
                      setState(() {
                        viRefresh = 1;
                        viRotate = 100;
                        showRefresh = true;
                      });
                      Future.delayed(const Duration(seconds: 3)).then((value) {
                        setState(() {
                          viRefresh = 0;
                          viRotate = 0;
                          showRefresh = false;
                        });
                      });
                    }
                  }
                  return true;
                },
              ),
            ),
            showRefresh
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: viRotate / 2),
                      child: Opacity(
                        opacity: viRefresh,
                        child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationZ(viRotate / 15),
                            child: Container(
                              width: 35,
                              height: 35,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 3,
                              ),
                            )),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  bool showRefresh = true;
  double viRefresh = 0;
  double viRotate = 90;
  List<DataModel> datas = <DataModel>[
    DataModel(
        imageUrl:
            'https://i.pinimg.com/474x/8e/28/21/8e2821a05f94ea3d86788a7e3956b70e.jpg',
        title: 'Page 01'),
    DataModel(
        imageUrl:
            'https://www.filmibeat.com/ph-big/2019/07/ismart-shankar_156195627930.jpg',
        title: 'Page 02'),
    DataModel(
        imageUrl:
            'https://i.pinimg.com/originals/35/dc/e0/35dce07a896e7597c88d702085698f6c.png',
        title: 'Page 03'),
    DataModel(
        imageUrl:
            'https://img.wallpapersafari.com/phone/1080/1920/87/4/zMpaLV.jpg',
        title: 'Page 04'),
  ];
}

class DataModel {
  final String imageUrl;
  final String title;
  DataModel({this.imageUrl, this.title});
}
