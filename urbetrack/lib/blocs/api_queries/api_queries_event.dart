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
  final List<String> vehicles;
  const FetchVehiclesEvent(this.vehicles);
  @override
  List<Object> get props => [vehicles];
}
class FetchStarshipsEvent extends ApiQueriesEvent {
  final List<String> starships;
  const FetchStarshipsEvent(this.starships);
  @override
  List<Object> get props => [starships];
}
