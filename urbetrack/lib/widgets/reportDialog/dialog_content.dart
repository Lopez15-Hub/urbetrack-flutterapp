import 'package:flutter/material.dart';
import 'form_dialog.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
    required TextEditingController characterNameController,
    required GlobalKey<FormState> formKey,
    this.isReportCreated = false,
  })  : _characterNameController = characterNameController,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _characterNameController;
  final GlobalKey<FormState> _formKey;
  final bool isReportCreated;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isReportCreated ? 'Reporte creado exitosamente.' : '',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isReportCreated ? Colors.green : Colors.black),
          ),
          ReportDialogForm(
            characterNameController: _characterNameController,
            reportDialogKey: _formKey,
          )
        ],
      ),
    );
  }
}
