import 'package:equatable/equatable.dart';

class PhotoDsDto extends Equatable {
  factory PhotoDsDto.fromJson(Map<String, dynamic> json) {
    return PhotoDsDto(
      id: json['id'] as int,
      albumId: json['albumId'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
  const PhotoDsDto({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'albumId': albumId,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  static List<PhotoDsDto> fromJsonList(List<dynamic> json) {
    return json.map((photo) => PhotoDsDto.fromJson(photo)).toList();
  }

  @override
  List<Object> get props => [id, albumId, title, url, thumbnailUrl];
}
