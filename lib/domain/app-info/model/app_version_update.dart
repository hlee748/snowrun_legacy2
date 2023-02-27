import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snowrun/domain/core/failures.dart';
import 'package:snowrun/domain/core/value_objects.dart';

part 'app_version_update.freezed.dart';
@freezed
class AppVersionUpdate with _$AppVersionUpdate {
  const AppVersionUpdate._();
  const factory AppVersionUpdate({
    required StringVO title,
    required StringVO description,
  }) = _AppVersionUpdate;

  factory AppVersionUpdate.empty() => AppVersionUpdate(
    title: StringVO(null),
    description: StringVO(null),
  );

  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit
        .andThen(description.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}