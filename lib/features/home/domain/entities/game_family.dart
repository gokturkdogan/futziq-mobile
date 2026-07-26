import 'package:equatable/equatable.dart';

class GameFamily extends Equatable {
  final String id;
  final String code;
  final String title;
  final String description;
  final String imageUrl;
  final String logoUrl;
  final int sortOrder;

  const GameFamily({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.logoUrl,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [id, code, title, description, imageUrl, logoUrl, sortOrder];
}
