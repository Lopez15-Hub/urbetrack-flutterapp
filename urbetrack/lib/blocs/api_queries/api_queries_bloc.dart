import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:urbetrack/models/character.dart';
import 'package:urbetrack/models/vehicle.dart';


import '../../services/services.dart';
part 'api_queries_event.dart';
part 'api_queries_state.dart';

class ApiQueriesBloc extends Bloc<ApiQueriesEvent, ApiQueriesState> {
  final SwapiService _swapiService;
  ApiQueriesBloc(this._swapiService) : super(ApiQueriesInitial()) {
    on<FetchStarWarsDataEvent>((event, emit) async {
      final charactersData = await _swapiService.getStarWarsCharactersData();
      emit(SetResponseData(charactersData.count, charactersData.next,
          charactersData.previous, charactersData.results));
    });
    on<FetchPlanetNameEvent>((event, emit) async {
      final String planet = await _swapiService.getPlanetName(event.planetUrl);
      emit(SetPlanetName(planet));
    });
    on<FetchVehiclesEvent>((event, emit) async {
      final vehiclesData = await _swapiService.getVehicles();
      emit(SetVehicles(vehiclesData.count, vehiclesData.next,
          vehiclesData.previous, vehiclesData.results));
    });
  }
}
