import '../../../../src/common/failure.dart';

/// Failure produced by the server
abstract class ServerFailure extends Failure {
  /// Creates a server failure with the code
  const ServerFailure(int code) : super(code: code);

  /// Creates a server failure with the code and message
  const ServerFailure.withMessage(int code, String message)
      : super(code: code, message: message);
}

class ConnectTimeoutDatasourceFailure extends ServerFailure {
  const ConnectTimeoutDatasourceFailure() : super(901);
}

class SendTimeoutDatasourceFailure extends ServerFailure {
  const SendTimeoutDatasourceFailure() : super(902);
}

class ReceiveTimeoutDatasourceFailure extends ServerFailure {
  const ReceiveTimeoutDatasourceFailure() : super(903);
}

class ResponseDatasourceFailure extends ServerFailure {
  const ResponseDatasourceFailure() : super(904);
}

class CancelDatasourceFailure extends ServerFailure {
  const CancelDatasourceFailure() : super(905);
}

class OtherDatasourceFailure extends ServerFailure {
  const OtherDatasourceFailure(String message)
      : super.withMessage(906, message);
}

class ServerDatasourceFailure extends ServerFailure {
  const ServerDatasourceFailure() : super(907);
}

class UnauthorizedDatasourceFailure extends ServerFailure {
  const UnauthorizedDatasourceFailure(String message)
      : super.withMessage(908, message);
}
