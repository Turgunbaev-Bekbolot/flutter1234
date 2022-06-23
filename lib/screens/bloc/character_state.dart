import 'package:last_project/helpers/catch_exeption.dart';
import 'package:last_project/models/character_model.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterFetchedState extends CharacterState {
  final String query;

  CharacterFetchedState({required this.query});
}

class CharacterErrorState extends CharacterState {
  final CatchException? error;

  CharacterErrorState({this.error});
}
