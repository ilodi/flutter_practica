import 'package:meta/meta.dart' show required;

class YouTubeVideo {
  final String videoID, title, description, banner;

  YouTubeVideo(
      {@required this.videoID,
      @required this.title,
      @required this.description,
      @required this.banner});

//este proceso es un json serialization
//forma basica
  /*  static YouTubeVideo fromJson(Map<String,dynamic>json){

  }   */
  //forma recomendada
  factory YouTubeVideo.fromJson(Map<String, dynamic> json,
      {fromPlayList = false}) {
    final snippet = json['snippet'];
    final thumbnail =
        snippet['thumbnails']['standard'] ?? snippet['thumbnails']['high'];
    String videoId;

    if (!fromPlayList) {
      videoId = json['contentDetails']['upload']['videoId'];
    }else{
      //video desde api playlist items
      videoId = snippet['resourceId']['videoId'];
    }

    return YouTubeVideo(
      videoID: videoId,
      title: snippet['title'],
      description: snippet['description'],
      banner: thumbnail['url'],
    );
  }
}
