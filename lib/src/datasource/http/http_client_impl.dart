import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../common/types.dart';
import '../album_api/dto/photo_ds_dto.dart';
import '../common/failures/datasource_failures.dart';
import 'http_client.dart';

class AlbumHttpClientImpl implements AlbumHttpClient {
  AlbumHttpClientImpl({required this.client});
  final http.Client client;

  @override
  FutureResult<dynamic> request({
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
      return ResultExt.failure(OtherDatasourceFailure(e.toString()));
    }
  }

  FutureResult<dynamic> _handleRespose(
    http.Response response, {
    bool isListRequest = false,
  }) async {
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      try {
        if (isListRequest) {
          return ResultExt.value(PhotoDsDto.fromJsonList(jsonData));
        } else {
          return ResultExt.value(PhotoDsDto.fromJson(jsonData));
        }
      } catch (e) {
        return ResultExt.failure(
          OtherDatasourceFailure(e.toString()),
        );
      }
    } else if (response.statusCode == 404) {
      return ResultExt.failure(const NotFoundDatasourceFailure());
    } else if (response.statusCode == 500) {
      return ResultExt.failure(const InternalServerDatasourceFailure());
    } else if (response.statusCode == 401) {
      return ResultExt.failure(
        UnauthorizedDatasourceFailure(response.body),
      );
    } else {
      return ResultExt.failure(
          const OtherDatasourceFailure('Unknown service error'));
    }
  }
}
