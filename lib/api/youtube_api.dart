import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;
import 'package:practica/models/play_list.dart';
import 'package:practica/models/youtube_video.dart';

class YouTubeApi {
  final String apiKey;

  YouTubeApi({@required this.apiKey}) : assert(apiKey != null);

  String _getUrl(String endPoint, Map<String, String> queryParameters) {
    final uri = Uri(
        scheme: 'https',
        host: 'www.googleapis.com',
        path: '/youtube/v3/$endPoint',
        queryParameters: queryParameters);
    return uri.toString();
  }

  Future<List<PlayList>> getPlayList(String channelId) async {
    try {
      final String url = _getUrl('playlists', {
        "part": "snippet,contentDetails",
        "channelId": channelId,
        "key": this.apiKey,
        "maxResults": "20"
      });
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final parse = jsonDecode(response.body);
        // print('Response API ');
        //Que se comporte como una lista
        final List<PlayList> items = (parse['items'] as List)
            .map<PlayList>((item) => PlayList.fromJson(item))
            .toList();
        return items;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

//ultimos videos

  Future<List<YouTubeVideo>> getNewVideos(String channelId) async {
    try {
      final String url = _getUrl('activities', {
        "part": "snippet,contentDetails",
        "channelId": channelId,
        "key": this.apiKey,
        "maxResults": "20"
      });
      print("URL $url");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //1 se convierte el json
        final parse = jsonDecode(response.body);
        final List<YouTubeVideo> items = (parse['items'] as List)
            .map<YouTubeVideo>((item) => YouTubeVideo.fromJson(item))
            .toList();
            return items;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

//PlayListItems
  Future<List<YouTubeVideo>> getPlayListVideos(String playListId) async {
    try {
      final String url = _getUrl('playlistItems', {
        "part": "snippet",
        "playlistId": playListId,
        "key": this.apiKey,
        "maxResults": "50"
      });
      print("URL $url");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //1 se convierte el json
        final parse = jsonDecode(response.body);
        final List<YouTubeVideo> items = (parse['items'] as List)
            .map<YouTubeVideo>((item) => YouTubeVideo.fromJson(item, fromPlayList: true))
            .toList();
            return items;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

}
