import 'package:auto_route/annotations.dart';
import 'package:last_project/screens/character_screen.dart';
import 'package:last_project/screens/info_of_character_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    MaterialRoute(page: CharacterScreen, initial: true),
    MaterialRoute(page: InfoOfCharacterScreen),
  ],
)
class $AppRouter {}
