part of '../types.dart';

typedef ValueFunction<T> = T Function(T);
typedef FailureFunction<T> = T Function(Failure);

extension ResultExt<T> on Result {
  static Result<T> value<T>(T value) {
    return (null, value);
  }

  static failure(Failure failure) {
    return (failure, null);
  }

  T when({
    required ValueFunction<T> onValue,
    required FailureFunction<T> onFailure,
  }) {
    if (this.$2 != null) return onValue(this.$2);
    return onFailure(this.$1!);
  }

  T maybeWhen({
    required T Function() orElse,
    ValueFunction<T>? onValue,
    FailureFunction<T>? onFailure,
  }) {
    if (this.$2 != null) return onValue!(this.$2);
    if (this.$1 != null) return onFailure!(this.$1!);
    return orElse();
  }
}
