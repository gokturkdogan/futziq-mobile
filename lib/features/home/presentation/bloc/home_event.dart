import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeLanguageChanged extends HomeEvent {
  final String language;

  const HomeLanguageChanged(this.language);

  @override
  List<Object?> get props => [language];
}

class HomeLoadData extends HomeEvent {
  const HomeLoadData();
}
