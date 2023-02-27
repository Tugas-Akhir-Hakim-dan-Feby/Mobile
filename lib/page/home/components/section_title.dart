import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "See More",
            // ignore: unnecessary_const
            style: const TextStyle(color: const Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
