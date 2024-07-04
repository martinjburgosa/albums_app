import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../application/dtos/photo_dto.dart';
import '../../../../../config/route/routes.dart';

part 'detail_controller.g.dart';

@Riverpod(keepAlive: true)
class DetailController extends _$DetailController {
  @override
  PhotoDto? build() {
    return null;
  }

  void updateDetailViewWithPhoto(PhotoDto photo) {
    state = photo;
    Get.toNamed(Routes.detail.value);
  }
}
