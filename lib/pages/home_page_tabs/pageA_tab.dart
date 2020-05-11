import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:practica/api/account_api.dart';
import 'package:practica/api/youtube_api.dart';
import 'package:practica/models/play_list.dart';
import 'package:shimmer/shimmer.dart';

class PageA extends StatefulWidget {
  PageA({Key key}) : super(key: key);

  @override
  _PageAState createState() => _PageAState();
}

//para mantener un estado ente pantallas necesita sun mixin y tener activado true en PageController with AutomaticKeepAliveClientMixin
class _PageAState extends State<PageA> {
//Api
  AccountAPI _accountAPI = AccountAPI();

  YouTubeApi _youTubeAPI =
      YouTubeApi(apiKey: 'AIzaSyDmeDXnx8Q6Z0_mvVIr9J9s38EQT9wJwL0');

  //
  List<dynamic> _users = [];
  List<PlayList> _playList = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    final user = await _accountAPI.getUsers(1);
    final List<PlayList> playList =
        await _youTubeAPI.getPlayList("UCwXdFgeE9KYzlDdR7TG9cMw");
    setState(() {
      _users.addAll(user);
      _playList.addAll(playList);
      _isLoading = false;
    });
  }

  Widget _shimmer() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Shimmer(
              period: Duration(seconds: 3),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffcccccc),
                      ),
                    ),
                    SizedBox(height: 3),
                  ],
                ),
              ),
              gradient:
                  LinearGradient(colors: [Colors.white, Color(0xffeeeeee)]));
        },
        itemCount: 7,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

/*   bool _isEnabled = false;
  double _fontSize = 21; */
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _isLoading
            ? _shimmer()
            : Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        final dynamic item = _users[index];
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 70),
                            child: Column(children: <Widget>[
                              Expanded(
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: item['avatar'],
                                    placeholder: (_, __) => Center(
                                      child: NutsActivityIndicator(
                                        radius: 55,
                                        activeColor: Colors.cyan,
                                        inactiveColor: Colors.cyanAccent,
                                        tickCount: 3,
                                        startRatio: 0.64,
                                        animationDuration: Duration(seconds: 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(item['first_name']),
                            ]),
                          ),
                        );
                      },
                      itemCount: _users.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Text(_playList.length.toString()),
                ],
              )
      ],
    );
  }
}
/*   @override
  // returna true para mantener el estado recuerda que esto puede hacer que consuma recursos
  bool get wantKeepAlive => true;
}*/
