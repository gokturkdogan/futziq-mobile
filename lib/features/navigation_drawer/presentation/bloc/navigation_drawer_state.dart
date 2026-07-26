import 'package:equatable/equatable.dart';
import '../../domain/entities/menu_item_entity.dart';

enum NavigationDrawerStatus { initial, loading, success, failure }

class NavigationDrawerState extends Equatable {
  final NavigationDrawerStatus status;
  final List<MenuItemEntity> menuItems;
  final String? errorMessage;

  const NavigationDrawerState({
    this.status = NavigationDrawerStatus.initial,
    this.menuItems = const [],
    this.errorMessage,
  });

  NavigationDrawerState copyWith({
    NavigationDrawerStatus? status,
    List<MenuItemEntity>? menuItems,
    String? errorMessage,
  }) {
    return NavigationDrawerState(
      status: status ?? this.status,
      menuItems: menuItems ?? this.menuItems,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, menuItems, errorMessage];
}
