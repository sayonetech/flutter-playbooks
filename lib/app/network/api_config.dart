
class ApiConfiguration  {
  static const _baseUrl = 'https://api-p.becoapp.in/';
  static const _storesUrl = '$_baseUrl/api/v4/stores/';

  static String storeUrl(String loc){
      return (_storesUrl + loc) ;
  }
}