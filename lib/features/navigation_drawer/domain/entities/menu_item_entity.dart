import 'package:equatable/equatable.dart';

class MenuItemEntity extends Equatable {
  final String title;
  final String imageUrl;

  const MenuItemEntity({
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, imageUrl];
}
