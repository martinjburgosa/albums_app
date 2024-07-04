import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  PhotoDto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  final int albumId;

  final int id;

  final String title;

  final String url;

  final String thumbnailUrl;

  PhotoDto copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      PhotoDto(
        albumId: albumId ?? this.albumId,
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);

  static List<PhotoDto> fromJsonList(List<dynamic> json) =>
      json.map((e) => PhotoDto.fromJson(e)).toList();
}
