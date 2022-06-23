import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterCard extends StatelessWidget {
  final String text;
  final String text2;
  final String image;
  final String isAlive;

  const CharacterCard({
    Key? key,
    required this.text,
    required this.text2,
    required this.image,
    required this.isAlive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 27),
          width: 74.w,
          height: 74.h,
          child: Image.network(image),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isAlive,
                style: TextStyle(
                  color: const Color(0xff43D049),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  text,
                  style: TextStyle(
                    color: const Color(0xff0B1E2D),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  color: const Color(0xff828282),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 20,
        )
      ],
    );
  }
}
