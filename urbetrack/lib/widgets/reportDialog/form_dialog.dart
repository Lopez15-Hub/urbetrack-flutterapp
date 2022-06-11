import 'package:flutter/material.dart';
class ReportDialogForm extends StatelessWidget {
  const ReportDialogForm({Key? key,this.reportDialogKey, this.characterNameController }) : super(key: key);
  final GlobalKey<FormState>? reportDialogKey;
  final TextEditingController? characterNameController;



  @override
  Widget build(BuildContext context) {
    return Form(
      key: reportDialogKey,
        child: TextFormField(
            validator: (value) =>value!.isEmpty ? 'Ingrese un nombre' : null,
            controller: characterNameController,
            decoration: const InputDecoration(
              labelText: 'Nombre del personaje',
            )));
  }
}
