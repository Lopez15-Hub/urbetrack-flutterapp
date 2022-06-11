import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:urbetrack/models/star_wars_character.dart';

import '../../services/services.dart';
part 'api_queries_event.dart';
part 'api_queries_state.dart';

class ApiQueriesBloc extends Bloc<ApiQueriesEvent, ApiQueriesState> {
  final SwapiService _swapiService;
  ApiQueriesBloc(this._swapiService) : super(ApiQueriesInitial()) {
    on<FetchStarWarsData>((event, emit) async {
      final charactersData = await _swapiService.getStarWarsCharactersData();
      emit(SetResponseData(charactersData.count, charactersData.next,
          charactersData.previous, charactersData.results));
    });
  }
}
