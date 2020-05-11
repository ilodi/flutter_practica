import 'package:meta/meta.dart' show required;

class PlayList {
  final String id, title, description, banner;
  final DateTime publishedAt;
  final int itemCount;
//constructor
  PlayList(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.banner,
      @required this.publishedAt,
      @required this.itemCount});

//metodo estatico ayuda un json que es un map a una instacia para su uso
  static PlayList fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final thumbnail =
        snippet['thumbnails']['standard'] ?? snippet['thumbnails']['high'];
    return PlayList(
        id: json['id'],
        title: snippet['title'],
        description: snippet['description'],
        banner: thumbnail['url'],
        publishedAt: DateTime.parse(snippet['publishedAt']),
        itemCount: json['contentDetails']['itemCount']);
  }
}
