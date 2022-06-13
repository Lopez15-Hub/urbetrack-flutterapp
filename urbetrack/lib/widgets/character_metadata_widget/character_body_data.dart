import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../general/custom_text.dart';
class CharacterBodyData extends StatelessWidget {
  const CharacterBodyData({
    Key? key,
    required this.characterData,
  }) : super(key: key);

  final Character characterData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Datos físicos",
          fontSize: 20,
          weight: FontWeight.bold,
        ),
        CustomText(
          text: "Color de ojos: ${characterData.eyeColor}",
          fontSize: 16,
          weight: FontWeight.bold,
        ),
        CustomText(
          text: "Color de pelo: ${characterData.hairColor}",
          fontSize: 16,
          weight: FontWeight.bold,
        ),
        CustomText(
          text: "Altura: ${characterData.height}",
          fontSize: 16,
          weight: FontWeight.bold,
        ),
        CustomText(
          text: "Peso: ${characterData.mass}",
          fontSize: 16,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}