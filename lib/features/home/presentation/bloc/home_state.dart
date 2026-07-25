import 'package:equatable/equatable.dart';

class GameModeModel extends Equatable {
  final String title;
  final String description;
  final String imageUrl;

  const GameModeModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, description, imageUrl];
}

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final String selectedLanguage;
  final List<GameModeModel> gameModes;
  final HomeStatus status;
  final String? errorMessage;

  const HomeState({
    this.selectedLanguage = 'TR',
    this.gameModes = const [],
    this.status = HomeStatus.initial,
    this.errorMessage,
  });

  HomeState copyWith({
    String? selectedLanguage,
    List<GameModeModel>? gameModes,
    HomeStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      gameModes: gameModes ?? this.gameModes,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [selectedLanguage, gameModes, status, errorMessage];
}
