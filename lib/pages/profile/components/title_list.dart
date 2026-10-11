import 'package:flutter/material.dart';
import 'package:learn_app/widgets/my_text_style.dart';

class TitleList extends StatelessWidget {
  final String title;
  final String vaule;
  const TitleList({super.key, required this.title, required this.vaule});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: myTextStyle()),
        Text(vaule, style: myTextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
