import '../../../../common/types.dart';
import '../../../http/http_client.dart';
import '../../common/album_api_path.dart';
import '../../dto/photo_ds_dto.dart';
import 'album_photos_datasource.dart';

class AlbumPhotosDatasourceImpl implements AlbumPhotosDatasource {
  AlbumPhotosDatasourceImpl({
    required this.httpClient,
  });

  final AlbumHttpClient httpClient;

  @override
  FutureResult<List<PhotoDsDto>> getAlbumPhotos(int page,
      {int? limit = 10}) async {
    final start = page * 10;

    final url =
        '${AlbumApiPath.baseUrl}${AlbumApiPath.photos}?_start=$start&_limit=$limit';

    return await httpClient.request(
      url: url,
      isListRequest: true,
    );
  }
}
