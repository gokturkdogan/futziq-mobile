import 'package:equatable/equatable.dart';

class Scope extends Equatable {
  final String id;
  final String code;
  final String title;

  const Scope({
    required this.id,
    required this.code,
    required this.title,
  });

  @override
  List<Object?> get props => [id, code, title];
}
