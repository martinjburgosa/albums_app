import '../../common/types.dart';

abstract class AlbumHttpClient {
  FutureResult<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
