import 'package:equatable/equatable.dart';
import '../../domain/entities/game_family.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final String selectedLanguage;
  final List<GameFamily> gameFamilies;
  final HomeStatus status;
  final String? errorMessage;

  const HomeState({
    this.selectedLanguage = 'TR',
    this.gameFamilies = const [],
    this.status = HomeStatus.initial,
    this.errorMessage,
  });

  HomeState copyWith({
    String? selectedLanguage,
    List<GameFamily>? gameFamilies,
    HomeStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      gameFamilies: gameFamilies ?? this.gameFamilies,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [selectedLanguage, gameFamilies, status, errorMessage];
}
