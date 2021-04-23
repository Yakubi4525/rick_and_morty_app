import 'package:rick_and_morty_app/domain/model/person_response.dart';

class PersonResponseInitilState extends PersonResponseModel {}

class PersonResponseLoadingState extends PersonResponseModel {}

class PersonResposeErrorState extends PersonResponseModel {
  String error;
  PersonResposeErrorState({this.error});
}

class PersonResponseOkState extends PersonResponseModel {
  PersonResponseOkState({PersonResponseModel model})
      : super(persons: model.persons);
}
