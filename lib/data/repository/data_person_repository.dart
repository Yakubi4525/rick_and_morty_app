import 'package:rick_and_morty_app/data/api/api_util.dart';
import 'package:rick_and_morty_app/domain/model/person_response.dart';
import 'package:rick_and_morty_app/domain/repository/persons_repository.dart';

class DataPersonRepository extends PersonRepository {
  final ApiUtil _apiUtil;

  DataPersonRepository(this._apiUtil);
  @override
  Future<PersonResponseModel> getListOfPersons() {
    try {
      return _apiUtil.getListOfArticles();
    } catch (error) {
      print("error in repository: ${error}");
      // rethrow;
    }
  }
}
