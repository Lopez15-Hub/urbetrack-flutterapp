import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'bottom_bar_navigation_event.dart';

class BottomBarNavigationBloc extends Bloc<BottomBarNavigationEvent, int> {
  BottomBarNavigationBloc() : super(0) {
    on<ChangePageView>((event, emit) => emit(event.newIndex));
  }
}
