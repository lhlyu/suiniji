import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required int page,
    required int max,
    required int size,
    required int total,
    required List<Item> list,
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required int id,
    required String title,
    required int ts,
    required int width,
    required int height,
    required List<String> tags,
    required Statistic statistic,
    required String url,
    required Author author,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}

@freezed
class Statistic with _$Statistic {
  const factory Statistic({
    required int bookmarks,
    required int likes,
    required int comments,
    required int views,
  }) = _Statistic;

  factory Statistic.fromJson(Map<String, Object?> json) => _$StatisticFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author({
    required int id,
    required String name,
    required String bio,
    required String avatar,
    required String background,
  }) = _Author;

  factory Author.fromJson(Map<String, Object?> json) => _$AuthorFromJson(json);
}
