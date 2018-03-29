import '../network/api.dart';
import 'package:event_bus/event_bus_hierarchical.dart';



class Injector {

  static final Injector injector = new Injector._injector();
  ApiClient _apiClient;
  EventBus _eventBus;

  Injector._injector(){
    _apiClient = new ApiClient();
    _eventBus = new HierarchicalEventBus();
  }


  factory Injector() {
    return injector;
  }

  ApiClient get apiClient => _apiClient;

  EventBus get eventBus => _eventBus;
}
