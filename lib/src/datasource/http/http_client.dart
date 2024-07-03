abstract class AlbumHttpClient {
  Future<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool isListRequest = false,
  });
}
