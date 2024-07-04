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

    return result.when(
      onValue: (list) => list,
      onFailure: (failure) => AsyncError(failure, StackTrace.current),
    );
  }

  Future<void> loadMorePhotos() async {
    ref.read(listPaginationControllerProvider.notifier).increment();

    final albumAppService = ref.read(albumValueAppServiceProvider);

    final result = await albumAppService
        .getAlbumPhotos(ref.read(listPaginationControllerProvider));

    return result.when(
      onFailure: (failure) => state = AsyncError(failure, StackTrace.current),
      onValue: (list) {
        final currentList = state.value;
        currentList!.addAll(list);
        state = AsyncValue.data(currentList);
      },
    );
  }
}

@Riverpod(keepAlive: true)
class ListPaginationController extends _$ListPaginationController {
  @override
  int build() => 1;

  void increment() {
    state++;
  }
}
