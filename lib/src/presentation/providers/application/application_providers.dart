import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/infrastructure/repositories/photos_repository.dart';
import '../../../application/infrastructure/repositories/photos_repository_impl.dart';
import '../../../application/infrastructure/value_app_services/album_value_app_service_impl.dart';
import '../../../application/value_app_services/album_value_app_services.dart';
import '../datasources/datasources_providers.dart';

part 'application_providers.g.dart';

@riverpod
PhotosRepository photosRepository(PhotosRepositoryRef ref) {
  return PhotosRepositoryImpl(
    remoteDataSource: ref.read(albumPhotosDatasourceProvider),
  );
}

@riverpod
AlbumValueAppService albumValueAppService(AlbumValueAppServiceRef ref) {
  return AlbumValueAppServiceImpl(
    photosRepository: ref.read(photosRepositoryProvider),
  );
}
