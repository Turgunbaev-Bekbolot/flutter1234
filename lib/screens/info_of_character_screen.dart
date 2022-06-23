import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_project/screens/widgets/info_of_character_card.dart';

class InfoOfCharacterScreen extends StatelessWidget {
  final String image;
  final String image2;
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
    required this.image2,
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
            Navigator.pop(context);
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
                  Image.network(
                    image,
                    width: 375.w,
                    height: 218.h,
                    fit: BoxFit.cover,
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
                        width: 8,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        image2,
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
