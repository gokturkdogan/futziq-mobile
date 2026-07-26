import '../../domain/entities/game_detail.dart';
import 'game_model.dart';

class GameDetailModel extends GameDetail {
  const GameDetailModel({
    required super.id,
    required super.code,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.logoUrl,
    required super.sortOrder,
    required super.catalogVersion,
    required super.games,
  });

  factory GameDetailModel.fromJson(Map<String, dynamic> json) {
    return GameDetailModel(
      id: json['id'] as String,
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      logoUrl: json['logoUrl'] as String,
      sortOrder: json['sortOrder'] as int,
      catalogVersion: json['catalogVersion'] as String,
      games: (json['games'] as List<dynamic>)
          .map((e) => GameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'logoUrl': logoUrl,
      'sortOrder': sortOrder,
      'catalogVersion': catalogVersion,
      'games': games.map((e) => (e as GameModel).toJson()).toList(),
    };
  }

  GameDetailModel copyWith({
    String? id,
    String? code,
    String? title,
    String? description,
    String? imageUrl,
    String? logoUrl,
    int? sortOrder,
    String? catalogVersion,
    List<GameModel>? games,
  }) {
    return GameDetailModel(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      sortOrder: sortOrder ?? this.sortOrder,
      catalogVersion: catalogVersion ?? this.catalogVersion,
      games: games ?? this.games.cast<GameModel>(),
    );
  }
}
