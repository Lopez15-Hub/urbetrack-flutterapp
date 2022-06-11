import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'connection_event.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, bool> {
  ConnectionBloc() : super(true) {
    on<ConnectToNetworkEvent>((event, emit) {
      emit(!event.isConnectedToNetwork);
    });
  }
}
