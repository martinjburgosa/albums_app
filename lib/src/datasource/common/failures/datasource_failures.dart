import '../../../../src/common/failure.dart';

/// Failure produced by the server
abstract class ServerFailure extends Failure {
  /// Creates a server failure with the code
  const ServerFailure(int code) : super(code: code);

  /// Creates a server failure with the code and message
  const ServerFailure.withMessage(int code, String message)
      : super(code: code, message: message);
}

class BadRequestDatasourceFailure extends ServerFailure {
  const BadRequestDatasourceFailure() : super(100);
}

class NotFoundDatasourceFailure extends ServerFailure {
  const NotFoundDatasourceFailure() : super(101);
}

class InternalServerDatasourceFailure extends ServerFailure {
  const InternalServerDatasourceFailure() : super(102);
}

class UnauthorizedDatasourceFailure extends ServerFailure {
  const UnauthorizedDatasourceFailure(String message)
      : super.withMessage(103, message);
}

class OtherDatasourceFailure extends ServerFailure {
  const OtherDatasourceFailure(String message)
      : super.withMessage(104, message);
}
