import 'dart:async';
import 'dart:convert' show utf8, json;
import 'dart:io';
import './auth_exception.dart';

class NetworkUtil {
  var httpClient = new HttpClient();
  //https://github.com/lucperkins/mesh/blob/master/lib/client/api_client.dart

  Future<dynamic> get(Uri url) async {
    HttpClientRequest request = await httpClient.getUrl(url)
      ..headers.add(HttpHeaders.ACCEPT, ContentType.JSON)
      ..headers.contentType = ContentType.JSON
      ..headers.chunkedTransferEncoding = false;
    HttpClientResponse response = await request.close();

    if (response.headers.contentType.toString() != ContentType.JSON.toString()) {
      throw new UnsupportedError('Server returned an unsupported content type: '
          '${response.headers.contentType} from ${request.uri}');
    }
    if (response.statusCode != HttpStatus.OK) {
      throw new StateError(
          'Server responded with error: ${response.statusCode} ${response.reasonPhrase}');
    }

    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      if(statusCode == 401){
        throw new AuthenticationException("401 Unauthorized at $url");
      }else{
        throw new Exception("Error while fetching data");
      }

    }
    return json.decode(await response.transform(utf8.decoder).join());
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