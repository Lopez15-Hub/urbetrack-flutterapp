part of 'api_queries_bloc.dart';

abstract class ApiQueriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ApiQueriesInitial extends ApiQueriesState {
  @override
  List<Object> get props => [];
}

class SetResponseData extends ApiQueriesState {
  final int count;
  final String next;
  final String previous;
  final List<Character> results;

  SetResponseData(this.count, this.next, this.previous, this.results);

  @override
  List<Object> get props => [count, next, previous, results];
}

class SetPlanetName extends ApiQueriesState {
  final String planetName;
  SetPlanetName(this.planetName);
  @override
  List<Object> get props => [planetName];
}

class SetVehicles extends ApiQueriesState {
  final List<Vehicle> vehicles;

  SetVehicles(this.vehicles);

  @override
  List<Object> get props => [vehicles];
}
class SetStarships extends ApiQueriesState {
  final List<Starship> starships;

  SetStarships(this.starships);

  @override
  List<Object> get props => [starships];
}


