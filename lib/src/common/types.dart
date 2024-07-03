import 'failure.dart';

part 'extensions/result_extension.dart';

/// Represents a [Future] that could've completed with a [Failure] or not
typedef FutureTry = Future<Failure?>;

/// Represents a [Record] tha is either a [Failure] or a [T]
typedef Result<T> = (Failure?, T);

/// Represents a [Future] that returns a [Failure] or a [T]
typedef FutureResult<T> = Future<Result<T>>;
