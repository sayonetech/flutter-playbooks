import 'package:uri/uri.dart';

class ApiConfiguration  {
  static const _baseUrl = 'https://api-p.becoapp.in';
  static UriTemplate storeApi = new UriTemplate("$_baseUrl/api/v4/stores/{?loc,location}");

  static Uri storeUrl(String lat, String lng){
      print(storeApi.expand({'loc': '$lat,$lng'}));
      return Uri.parse(storeApi.expand({'loc': '$lat,$lng'}));
  }
}