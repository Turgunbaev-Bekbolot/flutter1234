// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/character_screen/character_screen.dart' as _i1;
import '../screens/info_of_character_screen/info_of_character_screen.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CharacterRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CharacterScreen());
    },
    InfoOfCharacterRoute.name: (routeData) {
      final args = routeData.argsAs<InfoOfCharacterRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.InfoOfCharacterScreen(
              key: args.key,
              image: args.image,
              image2: args.image2,
              name: args.name,
              status: args.status,
              desc: args.desc,
              gender: args.gender,
              race: args.race,
              origin: args.origin,
              location: args.location));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(CharacterRoute.name, path: '/'),
        _i3.RouteConfig(InfoOfCharacterRoute.name,
            path: '/info-of-character-screen')
      ];
}

/// generated route for
/// [_i1.CharacterScreen]
class CharacterRoute extends _i3.PageRouteInfo<void> {
  const CharacterRoute() : super(CharacterRoute.name, path: '/');

  static const String name = 'CharacterRoute';
}

/// generated route for
/// [_i2.InfoOfCharacterScreen]
class InfoOfCharacterRoute extends _i3.PageRouteInfo<InfoOfCharacterRouteArgs> {
  InfoOfCharacterRoute(
      {_i4.Key? key,
      required String image,
      required String image2,
      required String name,
      required String status,
      required String desc,
      required String gender,
      required String race,
      required String origin,
      required String location})
      : super(InfoOfCharacterRoute.name,
            path: '/info-of-character-screen',
            args: InfoOfCharacterRouteArgs(
                key: key,
                image: image,
                image2: image2,
                name: name,
                status: status,
                desc: desc,
                gender: gender,
                race: race,
                origin: origin,
                location: location));

  static const String name = 'InfoOfCharacterRoute';
}

class InfoOfCharacterRouteArgs {
  const InfoOfCharacterRouteArgs(
      {this.key,
      required this.image,
      required this.image2,
      required this.name,
      required this.status,
      required this.desc,
      required this.gender,
      required this.race,
      required this.origin,
      required this.location});

  final _i4.Key? key;

  final String image;

  final String image2;

  final String name;

  final String status;

  final String desc;

  final String gender;

  final String race;

  final String origin;

  final String location;

  @override
  String toString() {
    return 'InfoOfCharacterRouteArgs{key: $key, image: $image, image2: $image2, name: $name, status: $status, desc: $desc, gender: $gender, race: $race, origin: $origin, location: $location}';
  }
}
