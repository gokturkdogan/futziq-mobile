import '../../domain/entities/game.dart';
import 'scope_model.dart';
import 'capabilities_model.dart';

class GameModel extends Game {
  const GameModel({
    required super.id,
    required super.code,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.bannerImageUrl,
    required super.sortOrder,
    required super.requiresScope,
    required super.scopes,
    required super.capabilities,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'] as String,
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      bannerImageUrl: json['bannerImageUrl'] as String,
      sortOrder: json['sortOrder'] as int,
      requiresScope: json['requiresScope'] as bool,
      scopes: (json['scopes'] as List<dynamic>)
          .map((e) => ScopeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      capabilities: CapabilitiesModel.fromJson(
          json['capabilities'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'bannerImageUrl': bannerImageUrl,
      'sortOrder': sortOrder,
      'requiresScope': requiresScope,
      'scopes': scopes.map((e) => (e as ScopeModel).toJson()).toList(),
      'capabilities': (capabilities as CapabilitiesModel).toJson(),
    };
  }

  GameModel copyWith({
    String? id,
    String? code,
    String? title,
    String? description,
    String? imageUrl,
    String? bannerImageUrl,
    int? sortOrder,
    bool? requiresScope,
    List<ScopeModel>? scopes,
    CapabilitiesModel? capabilities,
  }) {
    return GameModel(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
      sortOrder: sortOrder ?? this.sortOrder,
      requiresScope: requiresScope ?? this.requiresScope,
      scopes: scopes ?? this.scopes.cast<ScopeModel>(),
      capabilities: capabilities ?? (this.capabilities as CapabilitiesModel),
    );
  }
}
