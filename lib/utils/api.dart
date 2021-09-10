import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:youtube/model/video.dart';

const KEY_YOUTUBE = 'AIzaSyCNSJJ0V8Hm9KbGvf-81sfrQp3acdcCbrY';
const CHANEL_ID = 'UCthbIFAxbXTTQEC7EcQvP1Q';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class API {
  Future<List<Video>> pesquisar(String pesquisa) async {
    var dio = Dio();

    final response = await dio.get(URL_BASE +
        'search?' +
        'part=snippet&' +
        'channelId=$CHANEL_ID'
        
        '&maxResults=50' +
        '&key=' +
        KEY_YOUTUBE +
        '&order=date&q=$pesquisa');

    // print(response);
    String response2 = response.toString();

    var resposta = json.decode(response2);

    List<Video> videos = resposta['items'].map<Video>((map) {
      //  return Video.convertJson(map);
      return Video.fromJason(map);
    }).toList();

    return videos;

    // for (var video in videos) {
    //   print(video.title);
    // }
    // for (var video in resposta['items']) {
    //   print(video.toString());
    // }

    // List<Video> videos;

    // print(resposta);
  }
}


//https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCthbIFAxbXTTQEC7EcQvP1Q&key=AIzaSyBdUZNWlOGIFsnoddmWXTpeIaDxzgRNpms&order=date