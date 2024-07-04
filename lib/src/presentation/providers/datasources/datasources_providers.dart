import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../datasource/album_api/endpoints/photos/album_photos_datasource.dart';
import '../../../datasource/album_api/endpoints/photos/album_photos_datasource_impl.dart';
import '../../../datasource/http/http_client.dart';
import '../../../datasource/http/http_client_impl.dart';

part 'datasources_providers.g.dart';

@riverpod
Client client(ClientRef ref) => Client();

@riverpod
AlbumHttpClient albumHttpClient(AlbumHttpClientRef ref) {
  return AlbumHttpClientImpl(client: ref.read(clientProvider));
}

@riverpod
AlbumPhotosDatasource albumPhotosDatasource(AlbumPhotosDatasourceRef ref) {
  return AlbumPhotosDatasourceImpl(
      httpClient: ref.read(albumHttpClientProvider));
}
