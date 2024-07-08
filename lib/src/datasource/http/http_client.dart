import '../../common/types.dart';

abstract class HttpClient {
  FutureResult<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
