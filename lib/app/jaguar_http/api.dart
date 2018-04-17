import 'dart:async';
import 'package:http/http.dart';
import 'package:jaguar_http/jaguar_http.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import './store.dart';

part 'api.g.dart';

/// definition
@JaguarHttp(name: "Api")
abstract class ApiDefinition {

  @Get("/api/v4/stores/")
  Future<JaguarResponse<List<Store>>> getStores(
      {@QueryParam("loc") String loc});
}


class SOApi {
    JsonRepo repo = new JsonRepo()..add(new StoreSerializer());
    ApiDefinition api;

    SOApi() {
        api = new Api(
          client: new IOClient(),
          baseUrl: "https://api-p.becoapp.in",
          serializers: repo)
        ..requestInterceptors.add((JaguarRequest req) {
          return req;
        });

    }

    List<Store> fetchStores(String loc){
      api.getStores(loc:loc).then((JaguarResponse res) {
        print(res);
      }, onError: (e) {
        print(e);
      });
      return null;
    }
}