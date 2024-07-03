import 'package:json_annotation/json_annotation.dart';

part 'album_dto.g.dart';

@JsonSerializable()
class AlbumDto {
  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);

  AlbumDto({
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

  AlbumDto copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      AlbumDto(
        albumId: albumId ?? this.albumId,
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  Map<String, dynamic> toJson() => _$AlbumDtoToJson(this);
}
