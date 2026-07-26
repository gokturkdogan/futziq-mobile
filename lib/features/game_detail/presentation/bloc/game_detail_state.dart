import 'package:equatable/equatable.dart';
import '../../domain/entities/game_detail.dart';

abstract class GameDetailState extends Equatable {
  const GameDetailState();

  @override
  List<Object?> get props => [];
}

class GameDetailInitial extends GameDetailState {}

class GameDetailLoading extends GameDetailState {}

class GameDetailLoaded extends GameDetailState {
  final GameDetail gameDetail;

  const GameDetailLoaded(this.gameDetail);

  @override
  List<Object?> get props => [gameDetail];
}

class GameDetailFailure extends GameDetailState {
  final String message;

  const GameDetailFailure(this.message);

  @override
  List<Object?> get props => [message];
}
