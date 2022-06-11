import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../models/report.dart';
import 'dialog_content.dart';
class ReportDialogWidget extends StatefulWidget {
  const ReportDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ReportDialogWidget> createState() => _ReportDialogWidgetState();
}

class _ReportDialogWidgetState extends State<ReportDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _characterNameController =
      TextEditingController();
  String characterName = '';
  @override
  void dispose() {
    _characterNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _characterNameController.addListener(setCharacterName);
    super.initState();
  }

  void setCharacterName() {
   setState(() {
     characterName = _characterNameController.text;
   });
  }

  @override
  Widget build(BuildContext context) {
    final reportBloc = context.read<ReportBloc>();
    return BlocBuilder<ReportBloc, bool>(
      builder: (context, isReportCreated) {
        return AlertDialog(
          title: const Text("Reportar un avistamiento"),
          content: DialogContent(characterNameController: _characterNameController, formKey: _formKey,isReportCreated: isReportCreated),
          actions: dialogActions(isReportCreated, reportBloc, context),
        );
      },
    );
  }

  List<Widget> dialogActions(
      bool isReportCreated, ReportBloc reportBloc, BuildContext context) {
    final report = Report(
        userId: 1,
        dateTime: DateTime.now(),
        characterName:characterName);
    return <Widget>[
     
      Visibility(
        visible: !isReportCreated,
        child: ElevatedButton(
          child: const Text('Reportar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              return reportBloc.add(GenerateReportEvent(report));
            }
            return;
          },
        ),
      ),
    
      ElevatedButton(
        child: Text(isReportCreated ? 'Cerrar' : 'Cancelar'),
        onPressed: () {
          Navigator.of(context).pop();
          reportBloc.add(ResetReportStatus());
        },
      ),
    ];
  }
}
