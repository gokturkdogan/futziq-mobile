import '../../domain/entities/capabilities.dart';

class CapabilitiesModel extends Capabilities {
  const CapabilitiesModel({
    super.canPlay,
    super.canEdit,
    super.canDelete,
  });

  factory CapabilitiesModel.fromJson(Map<String, dynamic> json) {
    return CapabilitiesModel(
      canPlay: json['canPlay'] as bool?,
      canEdit: json['canEdit'] as bool?,
      canDelete: json['canDelete'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'canPlay': canPlay,
      'canEdit': canEdit,
      'canDelete': canDelete,
    };
  }

  CapabilitiesModel copyWith({
    bool? canPlay,
    bool? canEdit,
    bool? canDelete,
  }) {
    return CapabilitiesModel(
      canPlay: canPlay ?? this.canPlay,
      canEdit: canEdit ?? this.canEdit,
      canDelete: canDelete ?? this.canDelete,
    );
  }
}
