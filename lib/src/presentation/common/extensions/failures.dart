import 'package:get/get.dart';

import '../../../common/failure.dart';

extension FailureCodesTranslation on Failure {
  String get tr {
    if (message == null) {
      return _resolveLabel().tr;
    } else {
      return trParams({'message': message!})!;
    }
  }

  String? trParams([Map<String, String> params = const {}]) {
    return _resolveLabel().trParams(params);
  }

  String _resolveLabel() => 'lbl_failure_$code';
}
