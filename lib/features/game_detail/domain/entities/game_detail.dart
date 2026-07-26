import 'package:equatable/equatable.dart';
import 'game.dart';

class GameDetail extends Equatable {
  final String id;
  final String code;
  final String title;
  final String description;
  final String imageUrl;
  final String logoUrl;
  final int sortOrder;
  final String catalogVersion;
  final List<Game> games;

  const GameDetail({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.logoUrl,
    required this.sortOrder,
    required this.catalogVersion,
    required this.games,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        title,
        description,
        imageUrl,
        logoUrl,
        sortOrder,
        catalogVersion,
        games,
      ];
}
