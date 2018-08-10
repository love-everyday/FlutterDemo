import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:share_active/share_active.dart';

class ImageDetail extends StatefulWidget {
  ImageDetail({Key key, this.info}):super(key: key);
  final info;
  @override
  _ImageDetail createState() => _ImageDetail(info: info);
}


class _ImageDetail extends State<ImageDetail> {
  _ImageDetail({this.info}):super();
  final info;

  bool isShowAll = false;

  downloadFile() async {
    final film = info['albumDocInfo'];
    /*
    var response = await http.get(film["albumVImage"]);
    String dir = (await getApplicationDocumentsDirectory()).path;
    String filename = film["albumTitle"];
    File file = File('$dir/$filename.jpg');
    await file.writeAsBytes(response.bodyBytes);
    * */
    final linkUrl = film["albumLink"];
    if (linkUrl != null) {
      ShareActive.shareActive(url: linkUrl);
    }
  }

  showAllDescription() {
    setState(() {
      isShowAll = !isShowAll;
    });
  }

  Widget filmInfoWidget(film) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              film["albumTitle"],
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              softWrap: true,
            ),
            Text(
              film["score"].toString(),
              style: TextStyle(fontSize: 14.0, color: Colors.green.shade800),
            ),
            Offstage(
              offstage: film['region'] == null,
              child: RichText(
                text: TextSpan(
                    text: "地区：",
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text: film['region'],
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      )
                    ]
                ),
              ),
            ),
            Offstage(
              offstage: film['director'] == null,
              child: RichText(
                text: TextSpan(
                    text: "导演：",
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text: film['director'],
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      )
                    ]
                ),
              ),
            ),
            Offstage(
              offstage: film['star'] == null,
              child: RichText(
                text: TextSpan(
                    text: "演员：",
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    children: [
                      TextSpan(
                        text: film['star'],
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      )
                    ]
                ),
              ),
            ),
            Offstage(
                offstage: film['albumLink'] == null,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      width: 50.0,
                      height: 28.0,
                      child: RaisedButton(
                        child: Icon(Icons.ondemand_video, color: Colors.blueAccent,),
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          _launchURL(url: film["albumLink"]);
                        },
                        elevation: 1.0,
                        highlightElevation: 3.0,
                        highlightColor: Colors.white,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget filmDirectorAndActorsInfoWidget(film) {
    final videoMeta = film["video_lib_meta"];
    if (videoMeta == null) {
      return Offstage(offstage: true,);
    }
    List<dynamic> directors = videoMeta["director"];
    List<dynamic> actors = videoMeta["actor"];
    if (directors == null && actors == null) {
      return Offstage(offstage: true,);
    }
    List<Widget> directorWidgets = directors == null ? null : directors.map((director) {
      final url = director["image_url"] ?? "";
      final imageWidget = FadeInImage.assetNetwork(placeholder: "assets/placeholder.png", image: url, width: 114.0, height: 150.0, fit: BoxFit.fill,);
      final name = director["name"] ?? "";
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              imageWidget,
              Text(name)
            ],
          ),
        ),
        onTap: () {
          final _url = Uri.encodeFull('https://baike.baidu.com/item/$name');
          _launchURL(url: _url);
        },
      );
    }).toList();

    List<Widget> actorWidgets = actors == null ? null : actors.map((actor) {
      final url = actor["image_url"] ?? "";
      final imageWidget = FadeInImage.assetNetwork(placeholder: "assets/placeholder.png", image: url, width: 114.0, height: 150.0, fit: BoxFit.fill,);
      final name = actor["name"] ?? "";
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              imageWidget,
              Text(name)
            ],
          ),
        ),
        onTap: () {
          final _url = Uri.encodeFull('https://baike.baidu.com/item/$name');
          _launchURL(url: _url);
        },
      );
    }).toList();

    List<Widget> list = [];
    if (directorWidgets != null) {
      list.add(Container(child: Text('导演',), width: 10.0,margin: EdgeInsets.all(10.0),));
      list.addAll(directorWidgets);
    }
    if (actorWidgets != null) {
      list.add(Container(child: Text('演员',), width: 10.0,margin: EdgeInsets.all(10.0),));
      list.addAll(actorWidgets);
    }
    return Container(
      height: 200.0,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: list
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final film = info['albumDocInfo'];
    return Scaffold(
      appBar: AppBar(
        title: Text(film["albumTitle"]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: downloadFile,
        tooltip: 'Download Image',
        child: new Icon(Icons.share),
      ),
      body: ListView(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network(film["albumVImage"], width: 114.0, height: 150.0, fit: BoxFit.fill,),
              ),
              filmInfoWidget(film),
            ],
          ),
          GestureDetector(
            onTap: showAllDescription,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  RichText(
                    softWrap: true,
                    maxLines: isShowAll ? null : 2,
                    overflow: isShowAll ? TextOverflow.clip : TextOverflow.ellipsis,
                    text: TextSpan(
                      text: "简介：",
                      style: TextStyle(fontSize: 14.0, color: Colors.black26),
                      children: [
                        TextSpan(
                          text: film["description"],
                          style: TextStyle(fontSize: 14.0, color: Colors.black26),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0.0),
                    alignment: Alignment.center,
                    child: Icon(
                      isShowAll ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                      size: 24.0,
                      color: Colors.black26,
                    ),
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black26,
                  ),

                ],
              ),
            ),

          ),
          filmDirectorAndActorsInfoWidget(film),
        ],
      ),
    );
  }

  _launchURL({String url}) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}