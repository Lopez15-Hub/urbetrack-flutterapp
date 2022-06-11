part of 'api_queries_bloc.dart';

abstract class ApiQueriesEvent extends Equatable {
  const ApiQueriesEvent();

  @override
  List<Object> get props => [];
}

class FetchStarWarsDataEvent extends ApiQueriesEvent {
  @override
  List<Object> get props => [];
}

class FetchPlanetNameEvent extends ApiQueriesEvent {
  final String planetUrl;
  const FetchPlanetNameEvent(this.planetUrl);
  @override
  List<Object> get props => [planetUrl];
}

class FetchVehiclesEvent extends ApiQueriesEvent {
  @override
  List<Object> get props => [];
}


