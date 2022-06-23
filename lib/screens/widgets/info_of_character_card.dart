import 'package:flutter/material.dart';

class InfoOfCharacterCard extends StatelessWidget {
  final String text;
  final String text2;

  const InfoOfCharacterCard({
    Key? key,
    required this.text,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xff828282),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Color(0xff0B1E2D),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
