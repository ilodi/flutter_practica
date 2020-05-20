import 'package:practica/models/youtube_video.dart';

abstract class MasterEvents {}

class MasterSetTap extends MasterEvents {
  final int tab;

  MasterSetTap(this.tab);
}

class MasterAddHistory extends MasterEvents{
  final YouTubeVideo youTubeVideo;

  MasterAddHistory(this.youTubeVideo);
}