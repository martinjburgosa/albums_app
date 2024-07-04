import '../../common/types.dart';
import '../dtos/photo_dto.dart';

abstract class AlbumValueAppService {
  FutureResult<List<PhotoDto>> getAlbumPhotos(int page);
}
