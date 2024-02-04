// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(createToJson: false)
class Result {
  @JsonKey(name: 'code', defaultValue: 0, required: true)
  final int code;

  @JsonKey(name: 'msg', defaultValue: '', required: true)
  final String msg;

  @JsonKey(name: 'data')
  final dynamic data;

  const Result({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  bool ok() {
    return code == 0;
  }

  String tip() {
    return '$msg($code)';
  }
}
