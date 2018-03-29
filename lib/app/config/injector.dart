import '../network/api.dart';



class Injector {

  static final Injector injector = new Injector._injector();
  ApiClient _apiClient;

  Injector._injector(){
    _apiClient = new ApiClient();
  }


  factory Injector() {
    return injector;
  }

  ApiClient get apiClient => _apiClient;
}
