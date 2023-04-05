// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orderTrack_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderTrackState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(OrderTrackingModel? orderValue) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(OrderTrackingModel? orderValue)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(OrderTrackingModel? orderValue)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitOrderTrackState value) init,
    required TResult Function(LoadingOrderTrackState value) loading,
    required TResult Function(ErrorOrderTrackState value) error,
    required TResult Function(OrderTrackStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderTrackState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderTrackState value)? init,
    TResult? Function(LoadingOrderTrackState value)? loading,
    TResult? Function(ErrorOrderTrackState value)? error,
    TResult? Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderTrackState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderTrackState value)? init,
    TResult Function(LoadingOrderTrackState value)? loading,
    TResult Function(ErrorOrderTrackState value)? error,
    TResult Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderTrackState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrackStateCopyWith<$Res> {
  factory $OrderTrackStateCopyWith(
          OrderTrackState value, $Res Function(OrderTrackState) then) =
      _$OrderTrackStateCopyWithImpl<$Res, OrderTrackState>;
}

/// @nodoc
class _$OrderTrackStateCopyWithImpl<$Res, $Val extends OrderTrackState>
    implements $OrderTrackStateCopyWith<$Res> {
  _$OrderTrackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitOrderTrackStateCopyWith<$Res> {
  factory _$$InitOrderTrackStateCopyWith(_$InitOrderTrackState value,
          $Res Function(_$InitOrderTrackState) then) =
      __$$InitOrderTrackStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitOrderTrackStateCopyWithImpl<$Res>
    extends _$OrderTrackStateCopyWithImpl<$Res, _$InitOrderTrackState>
    implements _$$InitOrderTrackStateCopyWith<$Res> {
  __$$InitOrderTrackStateCopyWithImpl(
      _$InitOrderTrackState _value, $Res Function(_$InitOrderTrackState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitOrderTrackState implements InitOrderTrackState {
  const _$InitOrderTrackState();

  @override
  String toString() {
    return 'OrderTrackState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitOrderTrackState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(OrderTrackingModel? orderValue) success,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(OrderTrackingModel? orderValue)? success,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(OrderTrackingModel? orderValue)? success,
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
    required TResult Function(InitOrderTrackState value) init,
    required TResult Function(LoadingOrderTrackState value) loading,
    required TResult Function(ErrorOrderTrackState value) error,
    required TResult Function(OrderTrackStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderTrackState value) success,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderTrackState value)? init,
    TResult? Function(LoadingOrderTrackState value)? loading,
    TResult? Function(ErrorOrderTrackState value)? error,
    TResult? Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderTrackState value)? success,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderTrackState value)? init,
    TResult Function(LoadingOrderTrackState value)? loading,
    TResult Function(ErrorOrderTrackState value)? error,
    TResult Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderTrackState value)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitOrderTrackState implements OrderTrackState {
  const factory InitOrderTrackState() = _$InitOrderTrackState;
}

/// @nodoc
abstract class _$$LoadingOrderTrackStateCopyWith<$Res> {
  factory _$$LoadingOrderTrackStateCopyWith(_$LoadingOrderTrackState value,
          $Res Function(_$LoadingOrderTrackState) then) =
      __$$LoadingOrderTrackStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingOrderTrackStateCopyWithImpl<$Res>
    extends _$OrderTrackStateCopyWithImpl<$Res, _$LoadingOrderTrackState>
    implements _$$LoadingOrderTrackStateCopyWith<$Res> {
  __$$LoadingOrderTrackStateCopyWithImpl(_$LoadingOrderTrackState _value,
      $Res Function(_$LoadingOrderTrackState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingOrderTrackState implements LoadingOrderTrackState {
  const _$LoadingOrderTrackState();

  @override
  String toString() {
    return 'OrderTrackState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingOrderTrackState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(OrderTrackingModel? orderValue) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(OrderTrackingModel? orderValue)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(OrderTrackingModel? orderValue)? success,
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
    required TResult Function(InitOrderTrackState value) init,
    required TResult Function(LoadingOrderTrackState value) loading,
    required TResult Function(ErrorOrderTrackState value) error,
    required TResult Function(OrderTrackStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderTrackState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderTrackState value)? init,
    TResult? Function(LoadingOrderTrackState value)? loading,
    TResult? Function(ErrorOrderTrackState value)? error,
    TResult? Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderTrackState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderTrackState value)? init,
    TResult Function(LoadingOrderTrackState value)? loading,
    TResult Function(ErrorOrderTrackState value)? error,
    TResult Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderTrackState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingOrderTrackState implements OrderTrackState {
  const factory LoadingOrderTrackState() = _$LoadingOrderTrackState;
}

/// @nodoc
abstract class _$$ErrorOrderTrackStateCopyWith<$Res> {
  factory _$$ErrorOrderTrackStateCopyWith(_$ErrorOrderTrackState value,
          $Res Function(_$ErrorOrderTrackState) then) =
      __$$ErrorOrderTrackStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorOrderTrackStateCopyWithImpl<$Res>
    extends _$OrderTrackStateCopyWithImpl<$Res, _$ErrorOrderTrackState>
    implements _$$ErrorOrderTrackStateCopyWith<$Res> {
  __$$ErrorOrderTrackStateCopyWithImpl(_$ErrorOrderTrackState _value,
      $Res Function(_$ErrorOrderTrackState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorOrderTrackState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorOrderTrackState implements ErrorOrderTrackState {
  const _$ErrorOrderTrackState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrderTrackState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorOrderTrackState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorOrderTrackStateCopyWith<_$ErrorOrderTrackState> get copyWith =>
      __$$ErrorOrderTrackStateCopyWithImpl<_$ErrorOrderTrackState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(OrderTrackingModel? orderValue) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(OrderTrackingModel? orderValue)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(OrderTrackingModel? orderValue)? success,
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
    required TResult Function(InitOrderTrackState value) init,
    required TResult Function(LoadingOrderTrackState value) loading,
    required TResult Function(ErrorOrderTrackState value) error,
    required TResult Function(OrderTrackStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderTrackState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderTrackState value)? init,
    TResult? Function(LoadingOrderTrackState value)? loading,
    TResult? Function(ErrorOrderTrackState value)? error,
    TResult? Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderTrackState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderTrackState value)? init,
    TResult Function(LoadingOrderTrackState value)? loading,
    TResult Function(ErrorOrderTrackState value)? error,
    TResult Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderTrackState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorOrderTrackState implements OrderTrackState {
  const factory ErrorOrderTrackState(final String message) =
      _$ErrorOrderTrackState;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorOrderTrackStateCopyWith<_$ErrorOrderTrackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderTrackStatusOrderStateCopyWith<$Res> {
  factory _$$OrderTrackStatusOrderStateCopyWith(
          _$OrderTrackStatusOrderState value,
          $Res Function(_$OrderTrackStatusOrderState) then) =
      __$$OrderTrackStatusOrderStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$OrderTrackStatusOrderStateCopyWithImpl<$Res>
    extends _$OrderTrackStateCopyWithImpl<$Res, _$OrderTrackStatusOrderState>
    implements _$$OrderTrackStatusOrderStateCopyWith<$Res> {
  __$$OrderTrackStatusOrderStateCopyWithImpl(
      _$OrderTrackStatusOrderState _value,
      $Res Function(_$OrderTrackStatusOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$OrderTrackStatusOrderState(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderTrackStatusOrderState implements OrderTrackStatusOrderState {
  const _$OrderTrackStatusOrderState(this.status);

  @override
  final String status;

  @override
  String toString() {
    return 'OrderTrackState.orderStatus(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackStatusOrderState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrackStatusOrderStateCopyWith<_$OrderTrackStatusOrderState>
      get copyWith => __$$OrderTrackStatusOrderStateCopyWithImpl<
          _$OrderTrackStatusOrderState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(OrderTrackingModel? orderValue) success,
  }) {
    return orderStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(OrderTrackingModel? orderValue)? success,
  }) {
    return orderStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(OrderTrackingModel? orderValue)? success,
    required TResult orElse(),
  }) {
    if (orderStatus != null) {
      return orderStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitOrderTrackState value) init,
    required TResult Function(LoadingOrderTrackState value) loading,
    required TResult Function(ErrorOrderTrackState value) error,
    required TResult Function(OrderTrackStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderTrackState value) success,
  }) {
    return orderStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderTrackState value)? init,
    TResult? Function(LoadingOrderTrackState value)? loading,
    TResult? Function(ErrorOrderTrackState value)? error,
    TResult? Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderTrackState value)? success,
  }) {
    return orderStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderTrackState value)? init,
    TResult Function(LoadingOrderTrackState value)? loading,
    TResult Function(ErrorOrderTrackState value)? error,
    TResult Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderTrackState value)? success,
    required TResult orElse(),
  }) {
    if (orderStatus != null) {
      return orderStatus(this);
    }
    return orElse();
  }
}

abstract class OrderTrackStatusOrderState implements OrderTrackState {
  const factory OrderTrackStatusOrderState(final String status) =
      _$OrderTrackStatusOrderState;

  String get status;
  @JsonKey(ignore: true)
  _$$OrderTrackStatusOrderStateCopyWith<_$OrderTrackStatusOrderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedOrderTrackStateCopyWith<$Res> {
  factory _$$LoadedOrderTrackStateCopyWith(_$LoadedOrderTrackState value,
          $Res Function(_$LoadedOrderTrackState) then) =
      __$$LoadedOrderTrackStateCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderTrackingModel? orderValue});
}

/// @nodoc
class __$$LoadedOrderTrackStateCopyWithImpl<$Res>
    extends _$OrderTrackStateCopyWithImpl<$Res, _$LoadedOrderTrackState>
    implements _$$LoadedOrderTrackStateCopyWith<$Res> {
  __$$LoadedOrderTrackStateCopyWithImpl(_$LoadedOrderTrackState _value,
      $Res Function(_$LoadedOrderTrackState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderValue = freezed,
  }) {
    return _then(_$LoadedOrderTrackState(
      freezed == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as OrderTrackingModel?,
    ));
  }
}

/// @nodoc

class _$LoadedOrderTrackState implements LoadedOrderTrackState {
  const _$LoadedOrderTrackState(this.orderValue);

  @override
  final OrderTrackingModel? orderValue;

  @override
  String toString() {
    return 'OrderTrackState.success(orderValue: $orderValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedOrderTrackState &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedOrderTrackStateCopyWith<_$LoadedOrderTrackState> get copyWith =>
      __$$LoadedOrderTrackStateCopyWithImpl<_$LoadedOrderTrackState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(OrderTrackingModel? orderValue) success,
  }) {
    return success(orderValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(OrderTrackingModel? orderValue)? success,
  }) {
    return success?.call(orderValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(OrderTrackingModel? orderValue)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(orderValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitOrderTrackState value) init,
    required TResult Function(LoadingOrderTrackState value) loading,
    required TResult Function(ErrorOrderTrackState value) error,
    required TResult Function(OrderTrackStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderTrackState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderTrackState value)? init,
    TResult? Function(LoadingOrderTrackState value)? loading,
    TResult? Function(ErrorOrderTrackState value)? error,
    TResult? Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderTrackState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderTrackState value)? init,
    TResult Function(LoadingOrderTrackState value)? loading,
    TResult Function(ErrorOrderTrackState value)? error,
    TResult Function(OrderTrackStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderTrackState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoadedOrderTrackState implements OrderTrackState {
  const factory LoadedOrderTrackState(final OrderTrackingModel? orderValue) =
      _$LoadedOrderTrackState;

  OrderTrackingModel? get orderValue;
  @JsonKey(ignore: true)
  _$$LoadedOrderTrackStateCopyWith<_$LoadedOrderTrackState> get copyWith =>
      throw _privateConstructorUsedError;
}
