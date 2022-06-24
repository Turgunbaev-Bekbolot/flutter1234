import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_project/screens/character_screen/widgets/info_of_character_card.dart';

class InfoOfCharacterScreen extends StatelessWidget {
  final String image;
  final String name;
  final String status;
  final String desc;
  final String gender;
  final String race;
  final String origin;
  final String location;

  const InfoOfCharacterScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.status,
    required this.desc,
    required this.gender,
    required this.race,
    required this.origin,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            context.router.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 375.w,
                    height: 218.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 3,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 138.h,
                      left: 123.w,
                    ),
                    width: 146,
                    height: 146,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 8.r,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                name,
                style: TextStyle(
                  color: const Color(0xff0B1E2D),
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  color: const Color(0xff43D049),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                child: SizedBox(
                  width: 343.w,
                  height: 80.h,
                  child: Text(
                    desc,
                    style: TextStyle(
                      height: 1.5,
                      color: const Color(0xff0B1E2D),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  InfoOfCharacterCard(
                    text: 'Пол',
                    text2: gender,
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  InfoOfCharacterCard(
                    text: 'Расса',
                    text2: race,
                  ),
                ],
              ),
              Row(
                children: [
                  InfoOfCharacterCard(
                    text: 'Место рождения',
                    text2: origin,
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
              Row(
                children: [
                  InfoOfCharacterCard(
                    text: 'Местоположение',
                    text2: location,
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
