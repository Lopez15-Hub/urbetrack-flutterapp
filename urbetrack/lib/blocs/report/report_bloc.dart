import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../helpers/post_to_jsonplaceholder.dart';
import '../../models/report.dart';

part 'report_event.dart';

class ReportBloc extends Bloc<ReportEvent, bool> {
  ReportBloc() : super(false) {
    on<GenerateReportEvent>((event, emit) async {
      final bool isSubmitedToJsonPlaceholder =
          await reportToJsonPlaceholder(event.report);
      emit(isSubmitedToJsonPlaceholder);
    });
    on<ResetReportStatus>((event, emit) => emit(false));
  }
}
