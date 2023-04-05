// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<FavoriteFood>? foodList) success,
    required TResult Function(List<FavoriteFood>? searchResult) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<FavoriteFood>? foodList)? success,
    TResult? Function(List<FavoriteFood>? searchResult)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<FavoriteFood>? foodList)? success,
    TResult Function(List<FavoriteFood>? searchResult)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFoodState value) init,
    required TResult Function(LoadingFoodState value) loading,
    required TResult Function(ErrorFoodState value) error,
    required TResult Function(LoadedFoodState value) success,
    required TResult Function(LoadedSearchFoodState value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFoodState value)? init,
    TResult? Function(LoadingFoodState value)? loading,
    TResult? Function(ErrorFoodState value)? error,
    TResult? Function(LoadedFoodState value)? success,
    TResult? Function(LoadedSearchFoodState value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFoodState value)? init,
    TResult Function(LoadingFoodState value)? loading,
    TResult Function(ErrorFoodState value)? error,
    TResult Function(LoadedFoodState value)? success,
    TResult Function(LoadedSearchFoodState value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodStateCopyWith<$Res> {
  factory $FoodStateCopyWith(FoodState value, $Res Function(FoodState) then) =
      _$FoodStateCopyWithImpl<$Res, FoodState>;
}

/// @nodoc
class _$FoodStateCopyWithImpl<$Res, $Val extends FoodState>
    implements $FoodStateCopyWith<$Res> {
  _$FoodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitFoodStateCopyWith<$Res> {
  factory _$$InitFoodStateCopyWith(
          _$InitFoodState value, $Res Function(_$InitFoodState) then) =
      __$$InitFoodStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitFoodStateCopyWithImpl<$Res>
    extends _$FoodStateCopyWithImpl<$Res, _$InitFoodState>
    implements _$$InitFoodStateCopyWith<$Res> {
  __$$InitFoodStateCopyWithImpl(
      _$InitFoodState _value, $Res Function(_$InitFoodState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitFoodState implements InitFoodState {
  const _$InitFoodState();

  @override
  String toString() {
    return 'FoodState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitFoodState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<FavoriteFood>? foodList) success,
    required TResult Function(List<FavoriteFood>? searchResult) search,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<FavoriteFood>? foodList)? success,
    TResult? Function(List<FavoriteFood>? searchResult)? search,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<FavoriteFood>? foodList)? success,
    TResult Function(List<FavoriteFood>? searchResult)? search,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFoodState value) init,
    required TResult Function(LoadingFoodState value) loading,
    required TResult Function(ErrorFoodState value) error,
    required TResult Function(LoadedFoodState value) success,
    required TResult Function(LoadedSearchFoodState value) search,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFoodState value)? init,
    TResult? Function(LoadingFoodState value)? loading,
    TResult? Function(ErrorFoodState value)? error,
    TResult? Function(LoadedFoodState value)? success,
    TResult? Function(LoadedSearchFoodState value)? search,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFoodState value)? init,
    TResult Function(LoadingFoodState value)? loading,
    TResult Function(ErrorFoodState value)? error,
    TResult Function(LoadedFoodState value)? success,
    TResult Function(LoadedSearchFoodState value)? search,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitFoodState implements FoodState {
  const factory InitFoodState() = _$InitFoodState;
}

/// @nodoc
abstract class _$$LoadingFoodStateCopyWith<$Res> {
  factory _$$LoadingFoodStateCopyWith(
          _$LoadingFoodState value, $Res Function(_$LoadingFoodState) then) =
      __$$LoadingFoodStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingFoodStateCopyWithImpl<$Res>
    extends _$FoodStateCopyWithImpl<$Res, _$LoadingFoodState>
    implements _$$LoadingFoodStateCopyWith<$Res> {
  __$$LoadingFoodStateCopyWithImpl(
      _$LoadingFoodState _value, $Res Function(_$LoadingFoodState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingFoodState implements LoadingFoodState {
  const _$LoadingFoodState();

  @override
  String toString() {
    return 'FoodState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingFoodState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<FavoriteFood>? foodList) success,
    required TResult Function(List<FavoriteFood>? searchResult) search,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<FavoriteFood>? foodList)? success,
    TResult? Function(List<FavoriteFood>? searchResult)? search,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<FavoriteFood>? foodList)? success,
    TResult Function(List<FavoriteFood>? searchResult)? search,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFoodState value) init,
    required TResult Function(LoadingFoodState value) loading,
    required TResult Function(ErrorFoodState value) error,
    required TResult Function(LoadedFoodState value) success,
    required TResult Function(LoadedSearchFoodState value) search,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFoodState value)? init,
    TResult? Function(LoadingFoodState value)? loading,
    TResult? Function(ErrorFoodState value)? error,
    TResult? Function(LoadedFoodState value)? success,
    TResult? Function(LoadedSearchFoodState value)? search,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFoodState value)? init,
    TResult Function(LoadingFoodState value)? loading,
    TResult Function(ErrorFoodState value)? error,
    TResult Function(LoadedFoodState value)? success,
    TResult Function(LoadedSearchFoodState value)? search,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingFoodState implements FoodState {
  const factory LoadingFoodState() = _$LoadingFoodState;
}

/// @nodoc
abstract class _$$ErrorFoodStateCopyWith<$Res> {
  factory _$$ErrorFoodStateCopyWith(
          _$ErrorFoodState value, $Res Function(_$ErrorFoodState) then) =
      __$$ErrorFoodStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorFoodStateCopyWithImpl<$Res>
    extends _$FoodStateCopyWithImpl<$Res, _$ErrorFoodState>
    implements _$$ErrorFoodStateCopyWith<$Res> {
  __$$ErrorFoodStateCopyWithImpl(
      _$ErrorFoodState _value, $Res Function(_$ErrorFoodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorFoodState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorFoodState implements ErrorFoodState {
  const _$ErrorFoodState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FoodState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorFoodState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorFoodStateCopyWith<_$ErrorFoodState> get copyWith =>
      __$$ErrorFoodStateCopyWithImpl<_$ErrorFoodState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<FavoriteFood>? foodList) success,
    required TResult Function(List<FavoriteFood>? searchResult) search,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<FavoriteFood>? foodList)? success,
    TResult? Function(List<FavoriteFood>? searchResult)? search,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<FavoriteFood>? foodList)? success,
    TResult Function(List<FavoriteFood>? searchResult)? search,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFoodState value) init,
    required TResult Function(LoadingFoodState value) loading,
    required TResult Function(ErrorFoodState value) error,
    required TResult Function(LoadedFoodState value) success,
    required TResult Function(LoadedSearchFoodState value) search,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFoodState value)? init,
    TResult? Function(LoadingFoodState value)? loading,
    TResult? Function(ErrorFoodState value)? error,
    TResult? Function(LoadedFoodState value)? success,
    TResult? Function(LoadedSearchFoodState value)? search,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFoodState value)? init,
    TResult Function(LoadingFoodState value)? loading,
    TResult Function(ErrorFoodState value)? error,
    TResult Function(LoadedFoodState value)? success,
    TResult Function(LoadedSearchFoodState value)? search,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorFoodState implements FoodState {
  const factory ErrorFoodState(final String message) = _$ErrorFoodState;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorFoodStateCopyWith<_$ErrorFoodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedFoodStateCopyWith<$Res> {
  factory _$$LoadedFoodStateCopyWith(
          _$LoadedFoodState value, $Res Function(_$LoadedFoodState) then) =
      __$$LoadedFoodStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FavoriteFood>? foodList});
}

/// @nodoc
class __$$LoadedFoodStateCopyWithImpl<$Res>
    extends _$FoodStateCopyWithImpl<$Res, _$LoadedFoodState>
    implements _$$LoadedFoodStateCopyWith<$Res> {
  __$$LoadedFoodStateCopyWithImpl(
      _$LoadedFoodState _value, $Res Function(_$LoadedFoodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodList = freezed,
  }) {
    return _then(_$LoadedFoodState(
      freezed == foodList
          ? _value._foodList
          : foodList // ignore: cast_nullable_to_non_nullable
              as List<FavoriteFood>?,
    ));
  }
}

/// @nodoc

class _$LoadedFoodState implements LoadedFoodState {
  const _$LoadedFoodState(final List<FavoriteFood>? foodList)
      : _foodList = foodList;

  final List<FavoriteFood>? _foodList;
  @override
  List<FavoriteFood>? get foodList {
    final value = _foodList;
    if (value == null) return null;
    if (_foodList is EqualUnmodifiableListView) return _foodList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FoodState.success(foodList: $foodList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedFoodState &&
            const DeepCollectionEquality().equals(other._foodList, _foodList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foodList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedFoodStateCopyWith<_$LoadedFoodState> get copyWith =>
      __$$LoadedFoodStateCopyWithImpl<_$LoadedFoodState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<FavoriteFood>? foodList) success,
    required TResult Function(List<FavoriteFood>? searchResult) search,
  }) {
    return success(foodList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<FavoriteFood>? foodList)? success,
    TResult? Function(List<FavoriteFood>? searchResult)? search,
  }) {
    return success?.call(foodList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<FavoriteFood>? foodList)? success,
    TResult Function(List<FavoriteFood>? searchResult)? search,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(foodList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFoodState value) init,
    required TResult Function(LoadingFoodState value) loading,
    required TResult Function(ErrorFoodState value) error,
    required TResult Function(LoadedFoodState value) success,
    required TResult Function(LoadedSearchFoodState value) search,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFoodState value)? init,
    TResult? Function(LoadingFoodState value)? loading,
    TResult? Function(ErrorFoodState value)? error,
    TResult? Function(LoadedFoodState value)? success,
    TResult? Function(LoadedSearchFoodState value)? search,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFoodState value)? init,
    TResult Function(LoadingFoodState value)? loading,
    TResult Function(ErrorFoodState value)? error,
    TResult Function(LoadedFoodState value)? success,
    TResult Function(LoadedSearchFoodState value)? search,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoadedFoodState implements FoodState {
  const factory LoadedFoodState(final List<FavoriteFood>? foodList) =
      _$LoadedFoodState;

  List<FavoriteFood>? get foodList;
  @JsonKey(ignore: true)
  _$$LoadedFoodStateCopyWith<_$LoadedFoodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedSearchFoodStateCopyWith<$Res> {
  factory _$$LoadedSearchFoodStateCopyWith(_$LoadedSearchFoodState value,
          $Res Function(_$LoadedSearchFoodState) then) =
      __$$LoadedSearchFoodStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FavoriteFood>? searchResult});
}

/// @nodoc
class __$$LoadedSearchFoodStateCopyWithImpl<$Res>
    extends _$FoodStateCopyWithImpl<$Res, _$LoadedSearchFoodState>
    implements _$$LoadedSearchFoodStateCopyWith<$Res> {
  __$$LoadedSearchFoodStateCopyWithImpl(_$LoadedSearchFoodState _value,
      $Res Function(_$LoadedSearchFoodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = freezed,
  }) {
    return _then(_$LoadedSearchFoodState(
      freezed == searchResult
          ? _value._searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<FavoriteFood>?,
    ));
  }
}

/// @nodoc

class _$LoadedSearchFoodState implements LoadedSearchFoodState {
  const _$LoadedSearchFoodState(final List<FavoriteFood>? searchResult)
      : _searchResult = searchResult;

  final List<FavoriteFood>? _searchResult;
  @override
  List<FavoriteFood>? get searchResult {
    final value = _searchResult;
    if (value == null) return null;
    if (_searchResult is EqualUnmodifiableListView) return _searchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FoodState.search(searchResult: $searchResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedSearchFoodState &&
            const DeepCollectionEquality()
                .equals(other._searchResult, _searchResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchResult));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedSearchFoodStateCopyWith<_$LoadedSearchFoodState> get copyWith =>
      __$$LoadedSearchFoodStateCopyWithImpl<_$LoadedSearchFoodState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<FavoriteFood>? foodList) success,
    required TResult Function(List<FavoriteFood>? searchResult) search,
  }) {
    return search(searchResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<FavoriteFood>? foodList)? success,
    TResult? Function(List<FavoriteFood>? searchResult)? search,
  }) {
    return search?.call(searchResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<FavoriteFood>? foodList)? success,
    TResult Function(List<FavoriteFood>? searchResult)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFoodState value) init,
    required TResult Function(LoadingFoodState value) loading,
    required TResult Function(ErrorFoodState value) error,
    required TResult Function(LoadedFoodState value) success,
    required TResult Function(LoadedSearchFoodState value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFoodState value)? init,
    TResult? Function(LoadingFoodState value)? loading,
    TResult? Function(ErrorFoodState value)? error,
    TResult? Function(LoadedFoodState value)? success,
    TResult? Function(LoadedSearchFoodState value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFoodState value)? init,
    TResult Function(LoadingFoodState value)? loading,
    TResult Function(ErrorFoodState value)? error,
    TResult Function(LoadedFoodState value)? success,
    TResult Function(LoadedSearchFoodState value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class LoadedSearchFoodState implements FoodState {
  const factory LoadedSearchFoodState(final List<FavoriteFood>? searchResult) =
      _$LoadedSearchFoodState;

  List<FavoriteFood>? get searchResult;
  @JsonKey(ignore: true)
  _$$LoadedSearchFoodStateCopyWith<_$LoadedSearchFoodState> get copyWith =>
      throw _privateConstructorUsedError;
}
