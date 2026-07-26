import 'package:equatable/equatable.dart';
import 'scope.dart';
import 'capabilities.dart';

class Game extends Equatable {
  final String id;
  final String code;
  final String title;
  final String description;
  final String imageUrl;
  final String bannerImageUrl;
  final int sortOrder;
  final bool requiresScope;
  final List<Scope> scopes;
  final Capabilities capabilities;

  const Game({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.bannerImageUrl,
    required this.sortOrder,
    required this.requiresScope,
    required this.scopes,
    required this.capabilities,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        title,
        description,
        imageUrl,
        bannerImageUrl,
        sortOrder,
        requiresScope,
        scopes,
        capabilities,
      ];
}
