import '../../domain/entities/scope.dart';

class ScopeModel extends Scope {
  const ScopeModel({
    required super.id,
    required super.code,
    required super.title,
  });

  factory ScopeModel.fromJson(Map<String, dynamic> json) {
    return ScopeModel(
      id: json['id'] as String,
      code: json['code'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
    };
  }

  ScopeModel copyWith({
    String? id,
    String? code,
    String? title,
  }) {
    return ScopeModel(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
    );
  }
}
