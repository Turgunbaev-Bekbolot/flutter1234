import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_project/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_project/screens/character_screen/bloc/character_bloc.dart';
import 'package:last_project/screens/character_screen/bloc/character_event.dart';
import 'package:last_project/screens/character_screen/bloc/character_state.dart';
import 'package:last_project/screens/character_screen/widgets/character_card.dart';

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
        child: BlocConsumer<CharacterBloc, CharacterState>(
          bloc: characterBloc,
          listener: (context, state) {
            if (state is CharacterErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.toString())));
            }
          },
          builder: (context, state) {
            if (state is CharacterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharacterFetchedState) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ВСЕГО ПЕРСОНАЖЕЙ: ${state.characterModel.length}',
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
                      itemCount: state.characterModel.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            context.router.push(InfoOfCharacterRoute(
                              image: state.characterModel[index].image!,
                              image2: state.characterModel[index].image!,
                              name: state.characterModel[index].name!,
                              status: state.characterModel[index].status!,
                              desc: state.characterModel[index].species!,
                              gender: state.characterModel[index].gender!,
                              race: state.characterModel[index].species!,
                              origin: state.characterModel[index].origin!.name!,
                              location:
                                  state.characterModel[index].location!.name!,
                            ));
                          },
                          child: CharacterCard(
                              text: state.characterModel[index].origin!.name!,
                              text2: state.characterModel[index].gender!,
                              image: state.characterModel[index].image!,
                              isAlive: state.characterModel[index].status!),
                        );
                      }),
                    ),
                  ),
                ],
              );
            }
            if (state is CharacterErrorState) {
              return Center(
                child: ElevatedButton(
                  child: const Text('Обновить'),
                  onPressed: () {},
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
