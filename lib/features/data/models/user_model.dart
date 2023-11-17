import 'package:flutterbaseapp/features/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel implements User {
  @override
  int id;

  @override
  String name;

  @override
  String email;

  @override
  @JsonKey(name: 'created_at')
  String createdAt;

  @override
  @JsonKey(name: 'updated_at')
  String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.empty() => UserModel(
        id: 0,
        name: '',
        email: '',
        createdAt: '',
        updatedAt: '',
      );
}
