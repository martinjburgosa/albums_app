import '../../../common/types.dart';
import '../../../datasource/album_api/dto/photo_ds_dto.dart';
import '../../../datasource/album_api/endpoints/photos/album_photos_datasource.dart';
import '../../dtos/photo_dto.dart';
import 'photos_repository.dart';

class PhotosRepositoryImpl implements PhotosRepository {
  PhotosRepositoryImpl({
    required this.remoteDataSource,
  });

  final AlbumPhotosDatasource remoteDataSource;

  @override
  FutureResult<List<PhotoDto>> getAlbumPhotos(int page) async {
    final result = await remoteDataSource.getAlbumPhotos(page);
    return result.when(
      onValue: (list) => ResultExt.value(_parseDsList(list)),
      onFailure: (f) => ResultExt.failure(f),
    );
  }

  List<PhotoDto> _parseDsList(List<PhotoDsDto> dsList) {
    return dsList.map((e) => PhotoDto.fromJson(e.toJson())).toList();
  }
}
