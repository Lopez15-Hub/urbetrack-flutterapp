part of 'connection_bloc.dart';

abstract class ConnectionEvent extends Equatable {
  const ConnectionEvent();

  @override
  List<Object> get props => [];
}

class ConnectToNetworkEvent extends ConnectionEvent {
  final bool isConnectedToNetwork;

   const ConnectToNetworkEvent(this.isConnectedToNetwork);
    @override 
  List<Object> get props => [isConnectedToNetwork];
}