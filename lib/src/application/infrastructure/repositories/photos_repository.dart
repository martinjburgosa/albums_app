import '../../../common/types.dart';
import '../../dtos/photo_dto.dart';

abstract class PhotosRepository {
  FutureResult<List<PhotoDto>> getAlbumPhotos(int page);
}
