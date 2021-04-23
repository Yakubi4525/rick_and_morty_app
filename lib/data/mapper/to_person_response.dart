import 'package:rick_and_morty_app/data/api/model/api_person_response.dart';
import 'package:rick_and_morty_app/data/mapper/to_person.dart';
import 'package:rick_and_morty_app/domain/model/person_response.dart';

class PersonResponeModelMapper {
  static PersonResponseModel fromApi(
      ApiPersonResponseModel apiPersonResponseModel) {
    if (apiPersonResponseModel.persons == null) {
      return PersonResponseModel(persons: []);
    }
    return PersonResponseModel(
        persons: apiPersonResponseModel.persons
            .map((person) => PersonMapper.fromApi(person))
            .toList());
  }
}
