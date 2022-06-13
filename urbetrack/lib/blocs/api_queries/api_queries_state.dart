part of 'api_queries_bloc.dart';

abstract class ApiQueriesState extends Equatable {
  final String pageEndpoint;
  const ApiQueriesState(this.pageEndpoint);
  @override
  List<Object> get props => [];
}

class ApiQueriesInitial extends ApiQueriesState {
   final String peopleUrl;
  const ApiQueriesInitial(this.peopleUrl) : super(peopleUrl);
  @override
  List<Object> get props => [pageEndpoint];
}

class SetResponseData extends ApiQueriesState {
  final int count;
  final String next;
  final String previous;
  final List<Character> results;

  const SetResponseData(this.count, this.next, this.previous, this.results)
      : super('');

  @override
  List<Object> get props => [count, next, previous, results];
}

class SetPlanetName extends ApiQueriesState {
  final String planetName;
  
  const SetPlanetName(this.planetName) : super('');
  @override
  List<Object> get props => [planetName];
}

class SetVehicles extends ApiQueriesState {
  final List<Vehicle> vehicles;
  
  const SetVehicles(this.vehicles) : super('');

  @override
  List<Object> get props => [vehicles];
}

class SetStarships extends ApiQueriesState {
  final List<Starship> starships;

  const SetStarships(this.starships) : super('');

  @override
  List<Object> get props => [starships];
}

class SetNewPage extends ApiQueriesState {
  final String next;
  const SetNewPage(this.next) : super(next);
  @override
  List<Object> get props => [next];
}
