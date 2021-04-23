import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/domain/model/person.dart';

class PersonResponseModel {
  final List<PersonModel> persons;
  PersonResponseModel({@required this.persons});
}
