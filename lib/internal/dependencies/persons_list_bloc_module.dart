import 'package:rick_and_morty_app/data/repository/data_person_repository.dart';
import 'package:rick_and_morty_app/domain/bloc/get_list_of_persons_bloc.dart';
import 'package:rick_and_morty_app/internal/dependencies/api_module.dart';

class PersonsListModule {
  static GetPersonBloc _getPersonBloc;

  static GetPersonBloc getBloc() {
    if (_getPersonBloc == null) {
      _getPersonBloc =
          GetPersonBloc(DataPersonRepository(ApiModule.getApiUtil()));
    }
    return _getPersonBloc;
  }
}
