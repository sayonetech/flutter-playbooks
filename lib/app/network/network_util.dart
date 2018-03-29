import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  final JsonDecoder _decoder = new JsonDecoder();
  //https://github.com/lucperkins/mesh/blob/master/lib/client/api_client.dart
  Future<dynamic> get(String url) {
    return http.get(Uri.encodeFull(url),
        headers: {
          "Accept": "application/json"
        })
        .then((http.Response response) {

      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  void post(){
    //TODO implementation
  }

  void put(){
    //TODO implementation
  }

  void delete(){
    //TODO implementation
  }
}