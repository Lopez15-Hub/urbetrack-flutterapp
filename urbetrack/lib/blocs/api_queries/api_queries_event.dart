part of 'api_queries_bloc.dart';

abstract class ApiQueriesEvent extends Equatable {
  const ApiQueriesEvent();

  @override
  List<Object> get props => [];
}

class FetchStarWarsData extends ApiQueriesEvent {
  @override
  List<Object> get props => [];
}
