import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;
import 'package:practica/models/play_list.dart';

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
        print('Response API ');
        //Que se comporte como una lista
        final List<PlayList> items = (parse['items'] as List)
            .map<PlayList>((item) => PlayList.fromJson(item))
            .toList();
        return items;
      } else {
        return [];
        print('error ');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
