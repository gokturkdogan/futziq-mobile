import 'package:equatable/equatable.dart';

class MenuItemEntity extends Equatable {
  final String title;
  final String imageUrl;
  final String code;

  const MenuItemEntity({
    this.title = '',
    this.imageUrl = '',
    this.code = '',
  });

  @override
  List<Object?> get props => [title, imageUrl, code];
}
