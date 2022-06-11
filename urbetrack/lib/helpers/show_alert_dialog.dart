import 'package:flutter/material.dart';
import '../widgets/reportDialog/report_alert_dialog.dart';

showReportDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ReportDialogWidget();
    },
  );
}


