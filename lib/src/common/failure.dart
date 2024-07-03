import 'package:equatable/equatable.dart';

/// Base failure
abstract class Failure extends Equatable {
  /// Creates a failure with the code
  const Failure({required this.code, this.message})
      : assert(code != 0, 'Error codes should be not zero');

  /// The failure code
  final int code;

  /// The description of what happend in this error.
  final String? message;

  @override
  List<Object> get props => [code];
}