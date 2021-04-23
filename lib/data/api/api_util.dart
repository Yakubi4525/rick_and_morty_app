import 'package:rick_and_morty_app/data/api/service/rick_and_morty_service.dart';
import 'package:rick_and_morty_app/data/mapper/to_person_response.dart';
import 'package:rick_and_morty_app/domain/model/person_response.dart';

class ApiUtil {
  final RickAndMortyService _rickAndMortyService;

  ApiUtil(this._rickAndMortyService);

  Future<PersonResponseModel> getListOfArticles() async {
    var result;
    try {
      result = await _rickAndMortyService.getListOfPersons();
    } catch (errorValue) {
      print("error in apiutil: ${errorValue}");
      // rethrow;
    }
    return PersonResponeModelMapper.fromApi(result);
  }
}
