import '../../../../common/types.dart';
import '../../dto/photo_ds_dto.dart';

abstract class AlbumPhotosDatasource {
  FutureResult<List<PhotoDsDto>> getAlbumPhotos(int page);
}
