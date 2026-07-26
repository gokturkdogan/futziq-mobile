import '../../domain/entities/game_family.dart';

class GameFamilyModel extends GameFamily {
  const GameFamilyModel({
    required super.id,
    required super.code,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.logoUrl,
    required super.sortOrder,
  });

  factory GameFamilyModel.fromJson(Map<String, dynamic> json) {
    return GameFamilyModel(
      id: json['id'] as String,
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      logoUrl: json['logoUrl'] as String,
      sortOrder: json['sortOrder'] as int,
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
    };
  }
}
