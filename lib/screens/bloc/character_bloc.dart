import 'package:bloc/bloc.dart';
import 'package:last_project/helpers/catch_exeption.dart';
import 'package:last_project/helpers/query.dart';
import 'package:last_project/screens/bloc/character_event.dart';
import 'package:last_project/screens/bloc/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<GetCharacterEvent>((event, emit) async {
      emit(CharacterLoadingState());
      try {
        emit(CharacterFetchedState(query: query));
      } catch (e) {
        emit(CharacterErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
