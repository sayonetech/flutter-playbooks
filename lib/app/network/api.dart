import 'dart:async';
import './network_util.dart';
import './api_config.dart';
import '../models/store.dart';


class ApiClient {
  NetworkUtil _networkUtil;
  ApiClient (){
    _networkUtil = new NetworkUtil();
  }

  Future<List<Store>> fetchMalls(String loc) =>
      _networkUtil.get(ApiConfiguration.storeUrl(loc))
          .then((dynamic res) {
              List data = res;
              return data.map((obj) => new Store.map(obj)).toList();
      });

}