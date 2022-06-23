import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:last_project/helpers/query.dart';
import 'package:last_project/router/app_router.gr.dart';
import 'package:last_project/screens/bloc/character_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_project/screens/bloc/character_event.dart';
import 'package:last_project/screens/bloc/character_state.dart';
import 'package:last_project/screens/widgets/character_card.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late CharacterBloc characterBloc;

  @override
  void initState() {
    characterBloc = CharacterBloc();
    characterBloc.add(GetCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 15,
        ),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          bloc: characterBloc,
          builder: (context, state) {
            if (state is CharacterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharacterFetchedState) {
              return Query(
                options: QueryOptions(document: gql(query)),
                builder: (QueryResult result, {refetch, fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception!.graphqlErrors.toString());
                  }
                  if (result.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final query = result.data?['characters']['results'];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ВСЕГО ПЕРСОНАЖЕЙ: ${query.length}',
                            style: TextStyle(
                              color: const Color(0xff828282),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: query.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                context.router.push(InfoOfCharacterRoute(
                                  image: query[index]['image'],
                                  image2: query[index]['image'],
                                  name: query[index]['name'],
                                  status: query[index]['status'],
                                  desc: query[index]['species'],
                                  gender: query[index]['gender'],
                                  race: query[index]['species'],
                                  origin: query[index]['origin']['name'],
                                  location: query[index]['location']['name'],
                                ));
                              },
                              child: CharacterCard(
                                text: query[index]['name'],
                                text2: query[index]['gender'],
                                image: query[index]['image'],
                                isAlive: query[index]['status'],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
        // BlocConsumer<CharacterBloc, CharacterState>(
        //   bloc: characterBloc,
        //   listener: (context, state) {},
        //   builder: (context, state) {
        //     if (state is CharacterFetchedState) {
        //       return Column(
        //         children: [
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 'ВСЕГО ПЕРСОНАЖЕЙ: ${state.characterModel.length}',
        //                 style: TextStyle(
        //                   color: const Color(0xff828282),
        //                   fontSize: 10.sp,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //               ),
        //             ],
        //           ),
        //           Expanded(
        //             child: ListView.builder(
        //               itemCount: state.characterModel.length,
        //               itemBuilder: ((context, index) {
        //                 return InkWell(
        //                   onTap: () {
        //                     context.router.push(InfoOfCharacterRoute(
        //                       image: state.characterModel[index].image!,
        //                       image2: state.characterModel[index].image!,
        //                       name: state.characterModel[index].name!,
        //                       status:
        //                           state.characterModel[index].status.toString(),
        //                       desc: state.characterModel[index].created!.isUtc
        //                           .toString(),
        //                       gender:
        //                           state.characterModel[index].gender.toString(),
        //                       race: state.characterModel[index].species
        //                           .toString(),
        //                       origin: state.characterModel[index].origin!.name!,
        //                       location:
        //                           state.characterModel[index].location!.name!,
        //                     ));
        //                   },
        //                   child: CharacterCard(
        //                     text: state.characterModel[index].name!,
        //                     text2:
        //                         state.characterModel[index].gender.toString(),
        //                     image: state.characterModel[index].image!,
        //                     isAlive:
        //                         state.characterModel[index].status.toString(),
        //                   ),
        //                 );
        //               }),
        //             ),
        //           ),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
      ),
    );
  }
}
