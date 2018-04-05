import '../network/api.dart';
import 'package:map_view/map_view.dart';
import 'package:event_bus/event_bus.dart';


class Injector {

  static final Injector injector = new Injector._injector();
  ApiClient _apiClient;
  MapView _mapView;
  EventBus _eventBus = new EventBus();

  Injector._injector(){
    MapView.setApiKey("AIzaSyDKf8SiLaik7QuY8oFy-xv0UnWCMYWaTbE");
    _apiClient = new ApiClient();
    _mapView = new MapView();
  }


  factory Injector() {
    return injector;
  }

  ApiClient get apiClient => _apiClient;

  MapView get mapView => _mapView;

  EventBus get eventBus => _eventBus;
}
