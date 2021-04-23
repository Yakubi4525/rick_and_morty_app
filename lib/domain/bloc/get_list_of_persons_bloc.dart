import 'package:connectivity/connectivity.dart';
import 'package:rick_and_morty_app/domain/bloc_models/bloc_person_models.dart';
import 'package:rick_and_morty_app/domain/model/person_response.dart';
import 'package:rick_and_morty_app/domain/repository/persons_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetPersonBloc {
  PersonRepository _personRepository;

  final BehaviorSubject<PersonResponseModel> _subject =
      BehaviorSubject<PersonResponseModel>();
  GetPersonBloc(this._personRepository);

  BehaviorSubject<PersonResponseModel> get subject => _subject;

  PersonResponseModel get defaultItem => PersonResponseInitilState();

  void loadListOfPersons() async {
    _subject.sink.add(PersonResponseLoadingState());
    var _getListOfPersons;
    Connectivity connectivity = Connectivity();
    try {
      ConnectivityResult connect = await connectivity.checkConnectivity();
      if (connect != ConnectivityResult.none) {
        print('has internet');
        _getListOfPersons = await _personRepository.getListOfPersons();
      } 
    } catch (errorValue) {
      _subject.sink.add(PersonResposeErrorState(error: 'ошибка запроса'));
    }
    if (_getListOfPersons != null) {
      _subject.sink.add(PersonResponseOkState(model: _getListOfPersons));
    }
  }

  dispose() {
    _subject.close();
  }
}
