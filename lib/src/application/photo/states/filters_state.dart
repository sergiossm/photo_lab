import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';

part 'filters_state.freezed.dart';

@freezed
class FiltersState with _$FiltersState {
  const factory FiltersState({
    @Default(AsyncLoading<List<Filter>>()) AsyncValue<List<Filter>> filters,
  }) = _FiltersState;
}
