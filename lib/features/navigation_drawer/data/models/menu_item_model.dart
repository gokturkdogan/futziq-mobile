import '../../domain/entities/menu_item_entity.dart';

class MenuItemModel extends MenuItemEntity {
  const MenuItemModel({
    required String title,
    required String imageUrl,
  }) : super(title: title, imageUrl: imageUrl);

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
