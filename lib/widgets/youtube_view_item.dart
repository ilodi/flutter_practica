import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica/blocs/pages/master_bloc/master_bloc.dart';
import 'package:practica/blocs/pages/master_bloc/master_events.dart';
import 'package:practica/models/youtube_video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class YouTubeVideoItem extends StatelessWidget {
  final VoidCallback onDismissed;
  final YouTubeVideo item;

  const YouTubeVideoItem({Key key, @required this.item, this.onDismissed})
      : assert(item != null),
        super(key: key);

//funcion que retorna el widget dependiendo
  Widget _getView(MasterBloc masterBloc) {
    return CupertinoButton(
        child: AspectRatio(
          aspectRatio: 12 / 3,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                      imageUrl: item.banner,
                      fit: BoxFit.cover,
                      height: double.infinity),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.title,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                            item.description,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        padding: EdgeInsets.zero,
        onPressed: () {
          masterBloc.add(MasterAddHistory(item));
          FlutterYoutube.playYoutubeVideoByUrl(
              apiKey: "AIzaSyDmeDXnx8Q6Z0_mvVIr9J9s38EQT9wJwL0",
              videoUrl: "https://www.youtube.com/watch?v=${item.videoID}",
              autoPlay: true, //default falase
              fullScreen: true //default false
              );
        });
  }

  @override
  Widget build(BuildContext context) {
    final masterBloc = BlocProvider.of<MasterBloc>(context);

    if (onDismissed != null) {
      return Dismissible(
          key: Key(item.videoID),
          onDismissed: (_) {
            if (onDismissed != null) {
              onDismissed();
            }
          },
          child: _getView(masterBloc));
    }
    return _getView(masterBloc);
  }
}
