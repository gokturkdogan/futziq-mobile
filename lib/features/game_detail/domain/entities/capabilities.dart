import 'package:equatable/equatable.dart';

class Capabilities extends Equatable {
  final bool? canPlay;
  final bool? canEdit;
  final bool? canDelete;

  const Capabilities({
    this.canPlay,
    this.canEdit,
    this.canDelete,
  });

  @override
  List<Object?> get props => [canPlay, canEdit, canDelete];
}
