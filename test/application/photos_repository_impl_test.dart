import 'dart:convert';

import 'package:albums_app/src/application/config/failures/app_failures.dart';
import 'package:albums_app/src/application/infrastructure/repositories/photos_repository.dart';
import 'package:albums_app/src/application/infrastructure/repositories/photos_repository_impl.dart';
import 'package:albums_app/src/common/types.dart';
import 'package:albums_app/src/datasource/album_api/dto/photo_ds_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:albums_app/src/datasource/album_api/endpoints/photos/album_photos_datasource.dart';
import 'package:test/test.dart';

import '../fixtures/reader.dart';

class _MockAlbumPhotosDatasource extends Mock
    implements AlbumPhotosDatasource {}

void main() {
  late AlbumPhotosDatasource datasource;
  late PhotosRepository repository;

  setUp(() {
    datasource = _MockAlbumPhotosDatasource();
    repository = PhotosRepositoryImpl(remoteDataSource: datasource);
  });

  group('PhotosRepository', () {
    final photosJsonList = json.decode(fixture('photos_list.json')) as List;

    final photosList = PhotoDsDto.fromJsonList(photosJsonList);

    test('should return a list of photos', () async {
      // Arrange
      when(() => datasource.getAlbumPhotos(any()))
          .thenAnswer((_) async => ResultExt.value(photosList));
      // Act
      final result = await datasource.getAlbumPhotos(0);

      result.when(
        onValue: (photos) {
          // Assert
          expect(photos, photosList);
        },
        onFailure: (error) {
          fail('Should not return an error');
        },
      );
      // Assert
    });

    test('should return a failure when something went wrong', () async {
      // Arrange
      when(() => datasource.getAlbumPhotos(any()))
          .thenAnswer((_) async => ResultExt.failure(const TempFailure()));
      // Act
      final result = await repository.getAlbumPhotos(0);

      result.when(
        onValue: (photos) {
          fail('Should not return a value');
        },
        onFailure: (error) {
          // Assert
          expect(error, const TempFailure());
        },
      );
    });
  });
}
