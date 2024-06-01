import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<S, F> with _$Result<S, F> {
  const factory Result.success(S success) = Success;
  const factory Result.failure(F failure) = Failure;
}