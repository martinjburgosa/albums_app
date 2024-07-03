import 'dart:convert';
import 'package:http/http.dart' as http;

import '../album_api/dto/photo_ds_dto.dart';
import 'http_client.dart';

class AlbumHttpClientImpl implements AlbumHttpClient {
  AlbumHttpClientImpl({required this.client});
  final http.Client client;

  @override
  Future<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool isListRequest = false,
  }) async {
    final Map<String, String> defaultHeaders =
        headers?.cast<String, String>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
          });
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: defaultHeaders,
      );
      return _handleRespose(response, isListRequest: isListRequest);
    } catch (e) {
      throw Exception();
    }
  }

  Future<dynamic> _handleRespose(
    http.Response response, {
    bool isListRequest = false,
  }) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonData = jsonDecode(response.body);
      try {
        if (isListRequest) {
          return PhotoDsDto.fromJsonList(jsonData);
        } else {
          return PhotoDsDto.fromJson(jsonData);
        }
      } catch (e) {
        throw Exception();
      }
    }
  }
}
