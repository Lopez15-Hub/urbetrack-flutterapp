part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class GenerateReportEvent extends ReportEvent {
  final Report report;
  const GenerateReportEvent(this.report);
  @override
  List<Object> get props => [report];
}
class ResetReportStatus extends ReportEvent {
  @override
  List<Object> get props => [];
}