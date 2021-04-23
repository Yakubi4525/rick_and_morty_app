import 'package:rick_and_morty_app/data/api/model/api_person.dart';
import 'package:rick_and_morty_app/domain/model/person.dart';

class PersonMapper {
  static PersonModel fromApi(ApiPersonModel apiPersonModel) {

    if (apiPersonModel.hasError == true) return PersonModel();
    return PersonModel(
        id: apiPersonModel.id,
        name: apiPersonModel.name,
        status: apiPersonModel.status,
        image: apiPersonModel.image,
        gennder: apiPersonModel.gender,
        location: apiPersonModel.location,
        originName: apiPersonModel.originName,
        species: apiPersonModel.species);
  }
}
