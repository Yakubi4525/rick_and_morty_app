import 'package:rick_and_morty_app/data/api/api_util.dart';
import 'package:rick_and_morty_app/data/api/service/rick_and_morty_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil getApiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(RickAndMortyService());
    }
    return _apiUtil;
  }
}
