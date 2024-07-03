import '../../dto/photo_ds_dto.dart';

abstract class AlbumPhotosDatasource {
  Future<List<PhotoDsDto>> getAlbumPhotos(int page);
}
