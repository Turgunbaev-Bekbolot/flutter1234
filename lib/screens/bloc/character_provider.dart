import 'package:dio/dio.dart';
import 'package:last_project/helpers/api_requester.dart';
import 'package:last_project/helpers/catch_exeption.dart';
import 'package:last_project/models/character_model.dart';

class CharacterProvider {
  Future<List<CharacterModel>> getCharacter() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
        '/character/',
      );
      if (response.statusCode == 200) {
        List<CharacterModel> characterModelList = response.data['results']
            .map<CharacterModel>((el) => CharacterModel.fromJson(el))
            .toList();
        return characterModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
