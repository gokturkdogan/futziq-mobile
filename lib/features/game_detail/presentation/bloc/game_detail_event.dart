import 'package:equatable/equatable.dart';

abstract class GameDetailEvent extends Equatable {
  const GameDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadGameDetail extends GameDetailEvent {
  final String familyCode;

  const LoadGameDetail(this.familyCode);

  @override
  List<Object?> get props => [familyCode];
}
