part of 'bottom_bar_navigation_bloc.dart';


abstract class BottomBarNavigationEvent extends Equatable {
   const BottomBarNavigationEvent();
  @override 
  List<Object> get props => [];
  }

class ChangePageView extends BottomBarNavigationEvent {
  final int newIndex;

  const ChangePageView(this.newIndex);
    @override 
  List<Object> get props => [newIndex];
}
