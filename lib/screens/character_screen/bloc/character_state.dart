import 'package:last_project/models/character_model.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterFetchedState extends CharacterState {
  final List<CharacterModel> characterModel;

  CharacterFetchedState({required this.characterModel});
}

class CharacterErrorState extends CharacterState {
  final String? error;

  CharacterErrorState({this.error});
}
