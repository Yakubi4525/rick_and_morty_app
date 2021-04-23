import 'package:rick_and_morty_app/data/api/model/api_person.dart';

class ApiPersonResponseModel {
  List<ApiPersonModel> persons;
  String error;

  ApiPersonResponseModel({this.persons, this.error});

  ApiPersonResponseModel.fromApi(Map<String, dynamic> json) {
    try {
      //print(json['results']);
      persons = (json['results'] as List)
          .map((person) => new ApiPersonModel.fromJson(person))
          .toList();
      error = '';
      print(persons[1].location);
    } catch (errorValue) {
      rethrow;
    }
  }
}
