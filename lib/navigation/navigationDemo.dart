import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'dart:async';
import 'imageDetail.dart';

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> with AutomaticKeepAliveClientMixin<SampleAppPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  List<Widget> films = [];
  int page = 1;
  bool isLoadMore = false;
  BuildContext _context;
  ScrollController _scrollController = ScrollController();
  getFilmsInfo({bool isClean = false}) async {
    isLoadMore = true;
    var response = await http.get('http://search.video.iqiyi.com/o?if=pc&site=iqiyi&access_play_control_platform=17&showDate&ispurchase=&mode=11&ctgName=%E7%94%B5%E5%BD%B1&type=list&three_category_id=&p=11&p1=115&pos=1&pageSize=10&pageNum=$page');
    List<dynamic> infos = json.decode(response.body)["docinfos"];
    List<Widget> _widgets = [];
    for(int i = 0; i < infos.length; i++) {
      _widgets.add(_getItem(infos[i]));
    }
    setState(() {
      if (isClean) {
        films = _widgets;
      } else {
        films.addAll(_widgets);
      }
      isLoadMore = false;
    });
  }

  _refresh() async {
    this.page = 1;
    _scrollController.jumpTo(0.0);
    await getFilmsInfo(isClean: true);
  }

  pushToDetail(context, info) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new ImageDetail(info: info,)));
  }

  Future<void> _handleRefresh() async {
    final Completer<Null> completer = Completer<Null>();
    await _refresh();
    new Timer(const Duration(seconds: 1), () { completer.complete(null); });
    return completer.future.then((_) {

    });
  }
  

  @override
  void initState() {
    super.initState();
    print('initState');
    print(films);
    getFilmsInfo();
    _scrollController.addListener(() {
      if (!isLoadMore && _scrollController.position.pixels + 20.0 >= _scrollController.position.maxScrollExtent) {
        this.page++;
        getFilmsInfo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('iqiyi Demo'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _refreshIndicatorKey.currentState.show();
            },
//            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: RefreshIndicator(
            key: _refreshIndicatorKey,
            child: ListView.builder(
              itemCount: films.length,
              itemBuilder: (BuildContext context, int position) {
                return films[position];
              },
              controller: _scrollController,
            ),
            onRefresh: _handleRefresh
        ),
      ),
    );
  }

  Widget _getItem(info) {
    final film = info['albumDocInfo'];
    var star = film["star"];
    if (star == null) {
      star = "";
    }
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.0),
        elevation: 3.0,
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(film["albumVImage"], width: 114.0, height: 150.0, fit: BoxFit.fill,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      film["albumTitle"],
                      style: TextStyle(fontSize: 18.0, color: Colors.deepOrange),
                    ),
                    Text(
                      film["score"].toString(),
                      style: TextStyle(fontSize: 14.0, color: Colors.green.shade800),
                    ),
                    Text(
                      star,
                      style: Theme.of(context).textTheme.body1.copyWith(color: const Color(0xFF60646B)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Text(
                      film["description"],
                      style: TextStyle(fontSize: 14.0, color: Colors.black26),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
      onTap: () {
        print('Tap me!');
        pushToDetail(_context, info);
      },
    );
  }

  @override
  bool get wantKeepAlive => false;
}