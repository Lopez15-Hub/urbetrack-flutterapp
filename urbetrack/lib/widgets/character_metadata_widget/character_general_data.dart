import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets.dart';

class CharacterGeneralData extends StatelessWidget {
  const CharacterGeneralData({
    Key? key,
    required this.characterData,
  }) : super(key: key);

  final Character characterData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const CustomText(
          text: "Datos generales",
          fontSize: 20,
          weight: FontWeight.bold,
        ),
        CustomText(
          text: "Nombre: ${characterData.name}",
          fontSize: 16,
          weight: FontWeight.bold,
        ),
        CustomText(
          text: "Fecha de nacimiento: ${characterData.birthYear}",
          fontSize: 16,
          weight: FontWeight.bold,
        ),
        CustomText(
          text:
              "Género: ${characterData.gender == 'male' ? 'Masculino' : characterData.gender == 'female' ? 'Femenino' : 'Sin especificar'}",
          fontSize: 16,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}
