import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practica/models/youtube_video.dart';
import 'package:practica/widgets/youtube_view_item.dart';

class NewVideos extends StatelessWidget {
  final List<YouTubeVideo> items;

  const NewVideos({Key key, @required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        items.length,
        (index) {
          final YouTubeVideo item = items[index];
          return YouTubeVideoItem(item: item,);
        },
      ),
    );
  }
}
