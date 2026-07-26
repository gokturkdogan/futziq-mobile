import 'package:equatable/equatable.dart';

abstract class NavigationDrawerEvent extends Equatable {
  const NavigationDrawerEvent();

  @override
  List<Object> get props => [];
}

class LoadNavigationDrawerData extends NavigationDrawerEvent {
  const LoadNavigationDrawerData();
}
