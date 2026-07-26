import '../../domain/entities/menu_item_entity.dart';

class MenuItemModel extends MenuItemEntity {
  const MenuItemModel({
    String title = '',
    String imageUrl = '',
    String code = '',
  }) : super(
          title: title,
          imageUrl: imageUrl,
          code: code,
        );

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );
  }
}
