import 'dart:convert';

import 'package:albums_app/src/application/config/failures/app_failures.dart';
import 'package:albums_app/src/common/types.dart';
import 'package:albums_app/src/datasource/album_api/dto/photo_ds_dto.dart';
import 'package:albums_app/src/datasource/album_api/endpoints/photos/album_photos_datasource_impl.dart';
import 'package:albums_app/src/datasource/http/http_client.dart';

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../fixtures/reader.dart';

class _MockAlbumHttpClient extends Mock implements HttpClient {}

void main() {
  final httpClient = _MockAlbumHttpClient();
  final datasource = AlbumPhotosDatasourceImpl(httpClient: httpClient);

  group('AlbumPhotosDatasource', () {
    final photosJsonList = json.decode(fixture('photos_list.json')) as List;

    final photosList = PhotoDsDto.fromJsonList(photosJsonList);

    const url =
        'https://jsonplaceholder.typicode.com/photos?_start=0&_limit=10';

    test('should return a list of photos', () async {
      // Arrange
      when(() => httpClient.request(url: any(named: 'url'))).thenAnswer(
        (_) async => ResultExt.value(photosList),
      );
      // Act
      final result = await datasource.getAlbumPhotos(0);

      result.when(
        onValue: (list) => expect(list, photosList),
        onFailure: (error) => fail('Should not return an error'),
      );

      verify(() => httpClient.request(url: url)).called(1);
    });

    test('should return a failure when something went wrong', () async {
      // Arrange
      when(() => httpClient.request(url: any(named: 'url')))
          .thenAnswer((_) async => ResultExt.failure(const TempFailure()));
      // Act
      final result = await datasource.getAlbumPhotos(0);

      result.when(
        onValue: (photos) => fail('Should not return a value'),
        onFailure: (error) => expect(error, const TempFailure()),
      );
      // Assert
      verify(() => httpClient.request(url: url)).called(1);
    });
  });
}
