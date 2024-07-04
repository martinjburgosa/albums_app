import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/dtos/photo_dto.dart';
import '../../../../common/types.dart';
import '../../../providers/application/application_providers.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<List<PhotoDto>> build() async {
    final albumAppService = ref.read(albumValueAppServiceProvider);

    final result = await albumAppService
        .getAlbumPhotos(ref.read(listPaginationControllerProvider));

    result.when(
      onValue: (list) => state = AsyncData(list),
      onFailure: (failure) => state = AsyncError(failure, StackTrace.current),
    );
    return state.value!;
  }

  Future<List<PhotoDto>> loadPhotos() async {
    ref.read(listPaginationControllerProvider.notifier).increment();
    final albumAppService = ref.read(albumValueAppServiceProvider);

    final result = await albumAppService
        .getAlbumPhotos(ref.read(listPaginationControllerProvider));

    result.when(
      onFailure: (failure) =>
          state = AsyncValue.error(failure, StackTrace.current),
      onValue: (list) {
        final currentList = state.value;
        currentList!.addAll(list);
        return state = AsyncValue.data(currentList);
      },
    );

    return state.value!;
  }
}

@Riverpod(keepAlive: true)
class ListPaginationController extends _$ListPaginationController {
  @override
  int build() => 0;

  void increment() {
    state++;
  }
}
