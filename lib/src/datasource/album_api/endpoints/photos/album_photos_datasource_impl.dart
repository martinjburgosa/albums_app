import '../../../../common/types.dart';
import '../../../http/http_client.dart';
import '../../common/album_api_path.dart';
import '../../dto/photo_ds_dto.dart';
import 'album_photos_datasource.dart';

class AlbumPhotosDatasourceImpl implements AlbumPhotosDatasource {
  AlbumPhotosDatasourceImpl({
    required this.httpClient,
  });

  final HttpClient httpClient;

  @override
  FutureResult<List<PhotoDsDto>?> getAlbumPhotos(
    int page, {
    int? limit = 10,
  }) async {
    final start = page > 0 ? page * 10 : 0;
    final url =
        '${AlbumApiPath.baseUrl}${AlbumApiPath.photos}?_start=$start&_limit=$limit';

    final result = await httpClient.request(url: url);

    return result.when(
      onValue: (value) => ResultExt.value(value),
      onFailure: (failure) => ResultExt.failure(failure),
    );
  }
}
