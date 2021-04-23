import 'package:rick_and_morty_app/domain/model/person_response.dart';

abstract class PersonRepository {
  Future<PersonResponseModel> getListOfPersons();
}
