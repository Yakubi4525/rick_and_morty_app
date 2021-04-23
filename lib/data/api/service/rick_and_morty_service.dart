import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/data/api/model/api_person.dart';
import 'package:rick_and_morty_app/data/api/model/api_person_response.dart';

class RickAndMortyService {
  static String mainUrl = "https://rickandmortyapi.com";

  final Dio _dio = Dio(BaseOptions(baseUrl: mainUrl));

  // final Dio _dio = Dio(BaseOptions(baseUrl: mainUrl));
  Future<ApiPersonResponseModel> getListOfPersons() async {
    try {
      final response = await _dio.get('/api/character?page=1');
      if (response.statusCode == 200) {
        // print(response.data);
        return ApiPersonResponseModel.fromApi(response.data);
      }
      throw Exception("Ошибка запроса");
    } catch (errorValue) {
      print('error on service: ${errorValue}');
      // rethrow;
    }
  }
}
