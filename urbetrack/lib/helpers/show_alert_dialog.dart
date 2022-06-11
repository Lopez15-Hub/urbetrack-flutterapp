import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/models/report.dart';

import '../blocs/report/report_bloc.dart';

showReportDialog(BuildContext context) {
  var report =
      Report(userId: 1, dateTime: DateTime.now(), characterName: 'Fabricio');
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final reportBloc = context.read<ReportBloc>();
      return BlocBuilder<ReportBloc, bool>(
        builder: (context, isReportCreated) {
          return AlertDialog(
            title: const Text("Reportar un avistamiento"),
            content: Text(isReportCreated
                ? "Reporte creado exitosamente."
                : "Apriete reportar para crear un reporte."),
            actions: <Widget>[
              Visibility(
                visible: !isReportCreated,
                child: ElevatedButton(
                  child: const Text('Reportar'),
                  onPressed: () {
                    return reportBloc.add(GenerateReportEvent(report));
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
            ],
          );
        },
      );
    },
  );
}
