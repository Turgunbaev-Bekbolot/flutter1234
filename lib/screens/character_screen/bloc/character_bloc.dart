import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:last_project/helpers/api_requester.dart';
import 'package:last_project/helpers/query.dart';
import 'package:last_project/models/character_model.dart';
import 'package:last_project/screens/character_screen/bloc/character_event.dart';
import 'package:last_project/screens/character_screen/bloc/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<GetCharacterEvent>((event, emit) async {
      emit(CharacterLoadingState());
      try {
        QueryResult result = await ApiRequester.client!.query(
          QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.cacheAndNetwork,
          ),
        );
        if (result.hasException) {
          emit(CharacterErrorState(error: 'Произошла ошибка'));
        }
        List<CharacterModel> characterModel = result.data?['characters']
                ['results']
            .map<CharacterModel>((el) => CharacterModel.fromJson(el))
            .toList();
        emit(CharacterFetchedState(characterModel: characterModel));
      } catch (e) {
        emit(CharacterErrorState(error: 'Произошла ошибка'));
      }
    });
  }
}
