import '../../../common/failure.dart';

/// Failure produced by the domain
abstract class AppFailure extends Failure {
  /// Creates a domain failure with the code
  const AppFailure(int code) : super(code: code);
}

class TempFailure extends AppFailure {
  const TempFailure() : super(0);
}