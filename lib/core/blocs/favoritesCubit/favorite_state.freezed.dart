// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(bool status) checkFavorite,
    required TResult Function(FavoriteRestaurantModel? favoriteRestaurant)
        restaurantSuccess,
    required TResult Function(List<FavoriteFood> favoriteFood) foodSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(bool status)? checkFavorite,
    TResult? Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult? Function(List<FavoriteFood> favoriteFood)? foodSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(bool status)? checkFavorite,
    TResult Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult Function(List<FavoriteFood> favoriteFood)? foodSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFavoriteState value) init,
    required TResult Function(LoadingFavoriteState value) loading,
    required TResult Function(ErrorFavoriteState value) error,
    required TResult Function(CheckFavoriteState value) checkFavorite,
    required TResult Function(RestaurantLoadedFavoriteState value)
        restaurantSuccess,
    required TResult Function(FoodLoadedFavoriteState value) foodSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFavoriteState value)? init,
    TResult? Function(LoadingFavoriteState value)? loading,
    TResult? Function(ErrorFavoriteState value)? error,
    TResult? Function(CheckFavoriteState value)? checkFavorite,
    TResult? Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult? Function(FoodLoadedFavoriteState value)? foodSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFavoriteState value)? init,
    TResult Function(LoadingFavoriteState value)? loading,
    TResult Function(ErrorFavoriteState value)? error,
    TResult Function(CheckFavoriteState value)? checkFavorite,
    TResult Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult Function(FoodLoadedFavoriteState value)? foodSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitFavoriteStateCopyWith<$Res> {
  factory _$$InitFavoriteStateCopyWith(
          _$InitFavoriteState value, $Res Function(_$InitFavoriteState) then) =
      __$$InitFavoriteStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$InitFavoriteState>
    implements _$$InitFavoriteStateCopyWith<$Res> {
  __$$InitFavoriteStateCopyWithImpl(
      _$InitFavoriteState _value, $Res Function(_$InitFavoriteState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitFavoriteState implements InitFavoriteState {
  const _$InitFavoriteState();

  @override
  String toString() {
    return 'FavoriteState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitFavoriteState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(bool status) checkFavorite,
    required TResult Function(FavoriteRestaurantModel? favoriteRestaurant)
        restaurantSuccess,
    required TResult Function(List<FavoriteFood> favoriteFood) foodSuccess,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(bool status)? checkFavorite,
    TResult? Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult? Function(List<FavoriteFood> favoriteFood)? foodSuccess,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(bool status)? checkFavorite,
    TResult Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult Function(List<FavoriteFood> favoriteFood)? foodSuccess,
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
    required TResult Function(InitFavoriteState value) init,
    required TResult Function(LoadingFavoriteState value) loading,
    required TResult Function(ErrorFavoriteState value) error,
    required TResult Function(CheckFavoriteState value) checkFavorite,
    required TResult Function(RestaurantLoadedFavoriteState value)
        restaurantSuccess,
    required TResult Function(FoodLoadedFavoriteState value) foodSuccess,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFavoriteState value)? init,
    TResult? Function(LoadingFavoriteState value)? loading,
    TResult? Function(ErrorFavoriteState value)? error,
    TResult? Function(CheckFavoriteState value)? checkFavorite,
    TResult? Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult? Function(FoodLoadedFavoriteState value)? foodSuccess,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFavoriteState value)? init,
    TResult Function(LoadingFavoriteState value)? loading,
    TResult Function(ErrorFavoriteState value)? error,
    TResult Function(CheckFavoriteState value)? checkFavorite,
    TResult Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult Function(FoodLoadedFavoriteState value)? foodSuccess,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitFavoriteState implements FavoriteState {
  const factory InitFavoriteState() = _$InitFavoriteState;
}

/// @nodoc
abstract class _$$LoadingFavoriteStateCopyWith<$Res> {
  factory _$$LoadingFavoriteStateCopyWith(_$LoadingFavoriteState value,
          $Res Function(_$LoadingFavoriteState) then) =
      __$$LoadingFavoriteStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$LoadingFavoriteState>
    implements _$$LoadingFavoriteStateCopyWith<$Res> {
  __$$LoadingFavoriteStateCopyWithImpl(_$LoadingFavoriteState _value,
      $Res Function(_$LoadingFavoriteState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingFavoriteState implements LoadingFavoriteState {
  const _$LoadingFavoriteState();

  @override
  String toString() {
    return 'FavoriteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingFavoriteState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(bool status) checkFavorite,
    required TResult Function(FavoriteRestaurantModel? favoriteRestaurant)
        restaurantSuccess,
    required TResult Function(List<FavoriteFood> favoriteFood) foodSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(bool status)? checkFavorite,
    TResult? Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult? Function(List<FavoriteFood> favoriteFood)? foodSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(bool status)? checkFavorite,
    TResult Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult Function(List<FavoriteFood> favoriteFood)? foodSuccess,
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
    required TResult Function(InitFavoriteState value) init,
    required TResult Function(LoadingFavoriteState value) loading,
    required TResult Function(ErrorFavoriteState value) error,
    required TResult Function(CheckFavoriteState value) checkFavorite,
    required TResult Function(RestaurantLoadedFavoriteState value)
        restaurantSuccess,
    required TResult Function(FoodLoadedFavoriteState value) foodSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFavoriteState value)? init,
    TResult? Function(LoadingFavoriteState value)? loading,
    TResult? Function(ErrorFavoriteState value)? error,
    TResult? Function(CheckFavoriteState value)? checkFavorite,
    TResult? Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult? Function(FoodLoadedFavoriteState value)? foodSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFavoriteState value)? init,
    TResult Function(LoadingFavoriteState value)? loading,
    TResult Function(ErrorFavoriteState value)? error,
    TResult Function(CheckFavoriteState value)? checkFavorite,
    TResult Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult Function(FoodLoadedFavoriteState value)? foodSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingFavoriteState implements FavoriteState {
  const factory LoadingFavoriteState() = _$LoadingFavoriteState;
}

/// @nodoc
abstract class _$$ErrorFavoriteStateCopyWith<$Res> {
  factory _$$ErrorFavoriteStateCopyWith(_$ErrorFavoriteState value,
          $Res Function(_$ErrorFavoriteState) then) =
      __$$ErrorFavoriteStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$ErrorFavoriteState>
    implements _$$ErrorFavoriteStateCopyWith<$Res> {
  __$$ErrorFavoriteStateCopyWithImpl(
      _$ErrorFavoriteState _value, $Res Function(_$ErrorFavoriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorFavoriteState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorFavoriteState implements ErrorFavoriteState {
  const _$ErrorFavoriteState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorFavoriteState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorFavoriteStateCopyWith<_$ErrorFavoriteState> get copyWith =>
      __$$ErrorFavoriteStateCopyWithImpl<_$ErrorFavoriteState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(bool status) checkFavorite,
    required TResult Function(FavoriteRestaurantModel? favoriteRestaurant)
        restaurantSuccess,
    required TResult Function(List<FavoriteFood> favoriteFood) foodSuccess,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(bool status)? checkFavorite,
    TResult? Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult? Function(List<FavoriteFood> favoriteFood)? foodSuccess,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(bool status)? checkFavorite,
    TResult Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult Function(List<FavoriteFood> favoriteFood)? foodSuccess,
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
    required TResult Function(InitFavoriteState value) init,
    required TResult Function(LoadingFavoriteState value) loading,
    required TResult Function(ErrorFavoriteState value) error,
    required TResult Function(CheckFavoriteState value) checkFavorite,
    required TResult Function(RestaurantLoadedFavoriteState value)
        restaurantSuccess,
    required TResult Function(FoodLoadedFavoriteState value) foodSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFavoriteState value)? init,
    TResult? Function(LoadingFavoriteState value)? loading,
    TResult? Function(ErrorFavoriteState value)? error,
    TResult? Function(CheckFavoriteState value)? checkFavorite,
    TResult? Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult? Function(FoodLoadedFavoriteState value)? foodSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFavoriteState value)? init,
    TResult Function(LoadingFavoriteState value)? loading,
    TResult Function(ErrorFavoriteState value)? error,
    TResult Function(CheckFavoriteState value)? checkFavorite,
    TResult Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult Function(FoodLoadedFavoriteState value)? foodSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorFavoriteState implements FavoriteState {
  const factory ErrorFavoriteState(final String message) = _$ErrorFavoriteState;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorFavoriteStateCopyWith<_$ErrorFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckFavoriteStateCopyWith<$Res> {
  factory _$$CheckFavoriteStateCopyWith(_$CheckFavoriteState value,
          $Res Function(_$CheckFavoriteState) then) =
      __$$CheckFavoriteStateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class __$$CheckFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$CheckFavoriteState>
    implements _$$CheckFavoriteStateCopyWith<$Res> {
  __$$CheckFavoriteStateCopyWithImpl(
      _$CheckFavoriteState _value, $Res Function(_$CheckFavoriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$CheckFavoriteState(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckFavoriteState implements CheckFavoriteState {
  const _$CheckFavoriteState(this.status);

  @override
  final bool status;

  @override
  String toString() {
    return 'FavoriteState.checkFavorite(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckFavoriteState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckFavoriteStateCopyWith<_$CheckFavoriteState> get copyWith =>
      __$$CheckFavoriteStateCopyWithImpl<_$CheckFavoriteState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(bool status) checkFavorite,
    required TResult Function(FavoriteRestaurantModel? favoriteRestaurant)
        restaurantSuccess,
    required TResult Function(List<FavoriteFood> favoriteFood) foodSuccess,
  }) {
    return checkFavorite(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(bool status)? checkFavorite,
    TResult? Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult? Function(List<FavoriteFood> favoriteFood)? foodSuccess,
  }) {
    return checkFavorite?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(bool status)? checkFavorite,
    TResult Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult Function(List<FavoriteFood> favoriteFood)? foodSuccess,
    required TResult orElse(),
  }) {
    if (checkFavorite != null) {
      return checkFavorite(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFavoriteState value) init,
    required TResult Function(LoadingFavoriteState value) loading,
    required TResult Function(ErrorFavoriteState value) error,
    required TResult Function(CheckFavoriteState value) checkFavorite,
    required TResult Function(RestaurantLoadedFavoriteState value)
        restaurantSuccess,
    required TResult Function(FoodLoadedFavoriteState value) foodSuccess,
  }) {
    return checkFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFavoriteState value)? init,
    TResult? Function(LoadingFavoriteState value)? loading,
    TResult? Function(ErrorFavoriteState value)? error,
    TResult? Function(CheckFavoriteState value)? checkFavorite,
    TResult? Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult? Function(FoodLoadedFavoriteState value)? foodSuccess,
  }) {
    return checkFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFavoriteState value)? init,
    TResult Function(LoadingFavoriteState value)? loading,
    TResult Function(ErrorFavoriteState value)? error,
    TResult Function(CheckFavoriteState value)? checkFavorite,
    TResult Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult Function(FoodLoadedFavoriteState value)? foodSuccess,
    required TResult orElse(),
  }) {
    if (checkFavorite != null) {
      return checkFavorite(this);
    }
    return orElse();
  }
}

abstract class CheckFavoriteState implements FavoriteState {
  const factory CheckFavoriteState(final bool status) = _$CheckFavoriteState;

  bool get status;
  @JsonKey(ignore: true)
  _$$CheckFavoriteStateCopyWith<_$CheckFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestaurantLoadedFavoriteStateCopyWith<$Res> {
  factory _$$RestaurantLoadedFavoriteStateCopyWith(
          _$RestaurantLoadedFavoriteState value,
          $Res Function(_$RestaurantLoadedFavoriteState) then) =
      __$$RestaurantLoadedFavoriteStateCopyWithImpl<$Res>;
  @useResult
  $Res call({FavoriteRestaurantModel? favoriteRestaurant});
}

/// @nodoc
class __$$RestaurantLoadedFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$RestaurantLoadedFavoriteState>
    implements _$$RestaurantLoadedFavoriteStateCopyWith<$Res> {
  __$$RestaurantLoadedFavoriteStateCopyWithImpl(
      _$RestaurantLoadedFavoriteState _value,
      $Res Function(_$RestaurantLoadedFavoriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteRestaurant = freezed,
  }) {
    return _then(_$RestaurantLoadedFavoriteState(
      freezed == favoriteRestaurant
          ? _value.favoriteRestaurant
          : favoriteRestaurant // ignore: cast_nullable_to_non_nullable
              as FavoriteRestaurantModel?,
    ));
  }
}

/// @nodoc

class _$RestaurantLoadedFavoriteState implements RestaurantLoadedFavoriteState {
  const _$RestaurantLoadedFavoriteState(this.favoriteRestaurant);

  @override
  final FavoriteRestaurantModel? favoriteRestaurant;

  @override
  String toString() {
    return 'FavoriteState.restaurantSuccess(favoriteRestaurant: $favoriteRestaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantLoadedFavoriteState &&
            (identical(other.favoriteRestaurant, favoriteRestaurant) ||
                other.favoriteRestaurant == favoriteRestaurant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favoriteRestaurant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantLoadedFavoriteStateCopyWith<_$RestaurantLoadedFavoriteState>
      get copyWith => __$$RestaurantLoadedFavoriteStateCopyWithImpl<
          _$RestaurantLoadedFavoriteState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(bool status) checkFavorite,
    required TResult Function(FavoriteRestaurantModel? favoriteRestaurant)
        restaurantSuccess,
    required TResult Function(List<FavoriteFood> favoriteFood) foodSuccess,
  }) {
    return restaurantSuccess(favoriteRestaurant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(bool status)? checkFavorite,
    TResult? Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult? Function(List<FavoriteFood> favoriteFood)? foodSuccess,
  }) {
    return restaurantSuccess?.call(favoriteRestaurant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(bool status)? checkFavorite,
    TResult Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult Function(List<FavoriteFood> favoriteFood)? foodSuccess,
    required TResult orElse(),
  }) {
    if (restaurantSuccess != null) {
      return restaurantSuccess(favoriteRestaurant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFavoriteState value) init,
    required TResult Function(LoadingFavoriteState value) loading,
    required TResult Function(ErrorFavoriteState value) error,
    required TResult Function(CheckFavoriteState value) checkFavorite,
    required TResult Function(RestaurantLoadedFavoriteState value)
        restaurantSuccess,
    required TResult Function(FoodLoadedFavoriteState value) foodSuccess,
  }) {
    return restaurantSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFavoriteState value)? init,
    TResult? Function(LoadingFavoriteState value)? loading,
    TResult? Function(ErrorFavoriteState value)? error,
    TResult? Function(CheckFavoriteState value)? checkFavorite,
    TResult? Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult? Function(FoodLoadedFavoriteState value)? foodSuccess,
  }) {
    return restaurantSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFavoriteState value)? init,
    TResult Function(LoadingFavoriteState value)? loading,
    TResult Function(ErrorFavoriteState value)? error,
    TResult Function(CheckFavoriteState value)? checkFavorite,
    TResult Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult Function(FoodLoadedFavoriteState value)? foodSuccess,
    required TResult orElse(),
  }) {
    if (restaurantSuccess != null) {
      return restaurantSuccess(this);
    }
    return orElse();
  }
}

abstract class RestaurantLoadedFavoriteState implements FavoriteState {
  const factory RestaurantLoadedFavoriteState(
          final FavoriteRestaurantModel? favoriteRestaurant) =
      _$RestaurantLoadedFavoriteState;

  FavoriteRestaurantModel? get favoriteRestaurant;
  @JsonKey(ignore: true)
  _$$RestaurantLoadedFavoriteStateCopyWith<_$RestaurantLoadedFavoriteState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FoodLoadedFavoriteStateCopyWith<$Res> {
  factory _$$FoodLoadedFavoriteStateCopyWith(_$FoodLoadedFavoriteState value,
          $Res Function(_$FoodLoadedFavoriteState) then) =
      __$$FoodLoadedFavoriteStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FavoriteFood> favoriteFood});
}

/// @nodoc
class __$$FoodLoadedFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FoodLoadedFavoriteState>
    implements _$$FoodLoadedFavoriteStateCopyWith<$Res> {
  __$$FoodLoadedFavoriteStateCopyWithImpl(_$FoodLoadedFavoriteState _value,
      $Res Function(_$FoodLoadedFavoriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteFood = null,
  }) {
    return _then(_$FoodLoadedFavoriteState(
      null == favoriteFood
          ? _value._favoriteFood
          : favoriteFood // ignore: cast_nullable_to_non_nullable
              as List<FavoriteFood>,
    ));
  }
}

/// @nodoc

class _$FoodLoadedFavoriteState implements FoodLoadedFavoriteState {
  const _$FoodLoadedFavoriteState(final List<FavoriteFood> favoriteFood)
      : _favoriteFood = favoriteFood;

  final List<FavoriteFood> _favoriteFood;
  @override
  List<FavoriteFood> get favoriteFood {
    if (_favoriteFood is EqualUnmodifiableListView) return _favoriteFood;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteFood);
  }

  @override
  String toString() {
    return 'FavoriteState.foodSuccess(favoriteFood: $favoriteFood)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodLoadedFavoriteState &&
            const DeepCollectionEquality()
                .equals(other._favoriteFood, _favoriteFood));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteFood));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodLoadedFavoriteStateCopyWith<_$FoodLoadedFavoriteState> get copyWith =>
      __$$FoodLoadedFavoriteStateCopyWithImpl<_$FoodLoadedFavoriteState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(bool status) checkFavorite,
    required TResult Function(FavoriteRestaurantModel? favoriteRestaurant)
        restaurantSuccess,
    required TResult Function(List<FavoriteFood> favoriteFood) foodSuccess,
  }) {
    return foodSuccess(favoriteFood);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(bool status)? checkFavorite,
    TResult? Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult? Function(List<FavoriteFood> favoriteFood)? foodSuccess,
  }) {
    return foodSuccess?.call(favoriteFood);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(bool status)? checkFavorite,
    TResult Function(FavoriteRestaurantModel? favoriteRestaurant)?
        restaurantSuccess,
    TResult Function(List<FavoriteFood> favoriteFood)? foodSuccess,
    required TResult orElse(),
  }) {
    if (foodSuccess != null) {
      return foodSuccess(favoriteFood);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitFavoriteState value) init,
    required TResult Function(LoadingFavoriteState value) loading,
    required TResult Function(ErrorFavoriteState value) error,
    required TResult Function(CheckFavoriteState value) checkFavorite,
    required TResult Function(RestaurantLoadedFavoriteState value)
        restaurantSuccess,
    required TResult Function(FoodLoadedFavoriteState value) foodSuccess,
  }) {
    return foodSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitFavoriteState value)? init,
    TResult? Function(LoadingFavoriteState value)? loading,
    TResult? Function(ErrorFavoriteState value)? error,
    TResult? Function(CheckFavoriteState value)? checkFavorite,
    TResult? Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult? Function(FoodLoadedFavoriteState value)? foodSuccess,
  }) {
    return foodSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitFavoriteState value)? init,
    TResult Function(LoadingFavoriteState value)? loading,
    TResult Function(ErrorFavoriteState value)? error,
    TResult Function(CheckFavoriteState value)? checkFavorite,
    TResult Function(RestaurantLoadedFavoriteState value)? restaurantSuccess,
    TResult Function(FoodLoadedFavoriteState value)? foodSuccess,
    required TResult orElse(),
  }) {
    if (foodSuccess != null) {
      return foodSuccess(this);
    }
    return orElse();
  }
}

abstract class FoodLoadedFavoriteState implements FavoriteState {
  const factory FoodLoadedFavoriteState(final List<FavoriteFood> favoriteFood) =
      _$FoodLoadedFavoriteState;

  List<FavoriteFood> get favoriteFood;
  @JsonKey(ignore: true)
  _$$FoodLoadedFavoriteStateCopyWith<_$FoodLoadedFavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
