import 'package:flutter/material.dart';
import 'package:practica/api/youtube_api.dart';
import 'package:practica/models/youtube_video.dart';
import 'package:practica/widgets/my_appbar.dart';
import 'package:practica/widgets/video_item_shimmer.dart';
import 'package:practica/widgets/youtube_view_item.dart';

class PlayListVideosPage extends StatefulWidget {
  final String playListId;
  PlayListVideosPage({Key key, @required this.playListId}) : super(key: key);

  @override
  _PlayListVideosPageState createState() => _PlayListVideosPageState();
}

class _PlayListVideosPageState extends State<PlayListVideosPage> {
  List<YouTubeVideo> _videos = [];
  bool _loading = true;
  YouTubeApi _youTubeApi =
      YouTubeApi(apiKey: 'AIzaSyDmeDXnx8Q6Z0_mvVIr9J9s38EQT9wJwL0');

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    final List<YouTubeVideo> videos =
        await _youTubeApi.getPlayListVideos(widget.playListId);
    setState(() {
      _loading = false;
      _videos.addAll(videos);
    });
  }

  Widget _shimmer() {
    return ListView.builder(
      itemBuilder: (_, index) {
        return VideoItemShimmer();
      },
      itemCount: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          MyAppbar(
            leftIcon: 'https://image.flaticon.com/icons/svg/188/188923.svg',
            onLeftClick: () => Navigator.pop(context),
            rightIcon: 'https://image.flaticon.com/icons/svg/189/189012.svg',
          ),
          Expanded(
            child: _loading
                ? _shimmer()
                : ListView.builder(
                    itemBuilder: (_, index) {
                      final YouTubeVideo item = _videos[index];

                      return YouTubeVideoItem(item: item);
                    },
                    itemCount: _videos.length,
                  ),
          )
        ],
      ),
    )));
  }
}
