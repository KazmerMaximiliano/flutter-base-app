import 'package:flutterbaseapp/features/domain/entities/auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthModel implements Auth {
  @override
  @JsonKey(name: 'token')
  final String accessToken;

  AuthModel({
    required this.accessToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  factory AuthModel.empty() => AuthModel(
        accessToken: '',
      );
}
