

enum Flavor {
  DEV,
  PROD,
  STAGING
}

class Injector {

  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static configureFlavor(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

}