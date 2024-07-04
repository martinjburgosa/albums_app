import '../../../common/types.dart';
import '../../dtos/photo_dto.dart';
import '../../value_app_services/album_value_app_services.dart';
import '../repositories/photos_repository.dart';

class AlbumValueAppServiceImpl implements AlbumValueAppService {
  AlbumValueAppServiceImpl({
    required this.photosRepository,
  });

  final PhotosRepository photosRepository;

  @override
  FutureResult<List<PhotoDto>?> getAlbumPhotos(int page) async {
    final result = await photosRepository.getAlbumPhotos(page);
    return result.when(
      onValue: (list) => ResultExt.value(list),
      onFailure: (failure) => ResultExt.failure(failure),
    );
  }
}
