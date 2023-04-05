// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) generateOrderId,
    required TResult Function(String message) error,
    required TResult Function(OrderItem? orderItem, String? message) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? generateOrderId,
    TResult? Function(String message)? error,
    TResult? Function(OrderItem? orderItem, String? message)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? generateOrderId,
    TResult Function(String message)? error,
    TResult Function(OrderItem? orderItem, String? message)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitCartState value) init,
    required TResult Function(LoadingCartState value) loading,
    required TResult Function(OrderIdCartState value) generateOrderId,
    required TResult Function(ErrorCartState value) error,
    required TResult Function(LoadedCartState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitCartState value)? init,
    TResult? Function(LoadingCartState value)? loading,
    TResult? Function(OrderIdCartState value)? generateOrderId,
    TResult? Function(ErrorCartState value)? error,
    TResult? Function(LoadedCartState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCartState value)? init,
    TResult Function(LoadingCartState value)? loading,
    TResult Function(OrderIdCartState value)? generateOrderId,
    TResult Function(ErrorCartState value)? error,
    TResult Function(LoadedCartState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitCartStateCopyWith<$Res> {
  factory _$$InitCartStateCopyWith(
          _$InitCartState value, $Res Function(_$InitCartState) then) =
      __$$InitCartStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitCartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$InitCartState>
    implements _$$InitCartStateCopyWith<$Res> {
  __$$InitCartStateCopyWithImpl(
      _$InitCartState _value, $Res Function(_$InitCartState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitCartState implements InitCartState {
  const _$InitCartState();

  @override
  String toString() {
    return 'CartState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitCartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) generateOrderId,
    required TResult Function(String message) error,
    required TResult Function(OrderItem? orderItem, String? message) success,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? generateOrderId,
    TResult? Function(String message)? error,
    TResult? Function(OrderItem? orderItem, String? message)? success,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? generateOrderId,
    TResult Function(String message)? error,
    TResult Function(OrderItem? orderItem, String? message)? success,
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
    required TResult Function(InitCartState value) init,
    required TResult Function(LoadingCartState value) loading,
    required TResult Function(OrderIdCartState value) generateOrderId,
    required TResult Function(ErrorCartState value) error,
    required TResult Function(LoadedCartState value) success,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitCartState value)? init,
    TResult? Function(LoadingCartState value)? loading,
    TResult? Function(OrderIdCartState value)? generateOrderId,
    TResult? Function(ErrorCartState value)? error,
    TResult? Function(LoadedCartState value)? success,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCartState value)? init,
    TResult Function(LoadingCartState value)? loading,
    TResult Function(OrderIdCartState value)? generateOrderId,
    TResult Function(ErrorCartState value)? error,
    TResult Function(LoadedCartState value)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitCartState implements CartState {
  const factory InitCartState() = _$InitCartState;
}

/// @nodoc
abstract class _$$LoadingCartStateCopyWith<$Res> {
  factory _$$LoadingCartStateCopyWith(
          _$LoadingCartState value, $Res Function(_$LoadingCartState) then) =
      __$$LoadingCartStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadingCartState>
    implements _$$LoadingCartStateCopyWith<$Res> {
  __$$LoadingCartStateCopyWithImpl(
      _$LoadingCartState _value, $Res Function(_$LoadingCartState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingCartState implements LoadingCartState {
  const _$LoadingCartState();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingCartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) generateOrderId,
    required TResult Function(String message) error,
    required TResult Function(OrderItem? orderItem, String? message) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? generateOrderId,
    TResult? Function(String message)? error,
    TResult? Function(OrderItem? orderItem, String? message)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? generateOrderId,
    TResult Function(String message)? error,
    TResult Function(OrderItem? orderItem, String? message)? success,
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
    required TResult Function(InitCartState value) init,
    required TResult Function(LoadingCartState value) loading,
    required TResult Function(OrderIdCartState value) generateOrderId,
    required TResult Function(ErrorCartState value) error,
    required TResult Function(LoadedCartState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitCartState value)? init,
    TResult? Function(LoadingCartState value)? loading,
    TResult? Function(OrderIdCartState value)? generateOrderId,
    TResult? Function(ErrorCartState value)? error,
    TResult? Function(LoadedCartState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCartState value)? init,
    TResult Function(LoadingCartState value)? loading,
    TResult Function(OrderIdCartState value)? generateOrderId,
    TResult Function(ErrorCartState value)? error,
    TResult Function(LoadedCartState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCartState implements CartState {
  const factory LoadingCartState() = _$LoadingCartState;
}

/// @nodoc
abstract class _$$OrderIdCartStateCopyWith<$Res> {
  factory _$$OrderIdCartStateCopyWith(
          _$OrderIdCartState value, $Res Function(_$OrderIdCartState) then) =
      __$$OrderIdCartStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OrderIdCartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$OrderIdCartState>
    implements _$$OrderIdCartStateCopyWith<$Res> {
  __$$OrderIdCartStateCopyWithImpl(
      _$OrderIdCartState _value, $Res Function(_$OrderIdCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OrderIdCartState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderIdCartState implements OrderIdCartState {
  const _$OrderIdCartState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CartState.generateOrderId(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderIdCartState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderIdCartStateCopyWith<_$OrderIdCartState> get copyWith =>
      __$$OrderIdCartStateCopyWithImpl<_$OrderIdCartState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) generateOrderId,
    required TResult Function(String message) error,
    required TResult Function(OrderItem? orderItem, String? message) success,
  }) {
    return generateOrderId(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? generateOrderId,
    TResult? Function(String message)? error,
    TResult? Function(OrderItem? orderItem, String? message)? success,
  }) {
    return generateOrderId?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? generateOrderId,
    TResult Function(String message)? error,
    TResult Function(OrderItem? orderItem, String? message)? success,
    required TResult orElse(),
  }) {
    if (generateOrderId != null) {
      return generateOrderId(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitCartState value) init,
    required TResult Function(LoadingCartState value) loading,
    required TResult Function(OrderIdCartState value) generateOrderId,
    required TResult Function(ErrorCartState value) error,
    required TResult Function(LoadedCartState value) success,
  }) {
    return generateOrderId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitCartState value)? init,
    TResult? Function(LoadingCartState value)? loading,
    TResult? Function(OrderIdCartState value)? generateOrderId,
    TResult? Function(ErrorCartState value)? error,
    TResult? Function(LoadedCartState value)? success,
  }) {
    return generateOrderId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCartState value)? init,
    TResult Function(LoadingCartState value)? loading,
    TResult Function(OrderIdCartState value)? generateOrderId,
    TResult Function(ErrorCartState value)? error,
    TResult Function(LoadedCartState value)? success,
    required TResult orElse(),
  }) {
    if (generateOrderId != null) {
      return generateOrderId(this);
    }
    return orElse();
  }
}

abstract class OrderIdCartState implements CartState {
  const factory OrderIdCartState(final String message) = _$OrderIdCartState;

  String get message;
  @JsonKey(ignore: true)
  _$$OrderIdCartStateCopyWith<_$OrderIdCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCartStateCopyWith<$Res> {
  factory _$$ErrorCartStateCopyWith(
          _$ErrorCartState value, $Res Function(_$ErrorCartState) then) =
      __$$ErrorCartStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorCartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ErrorCartState>
    implements _$$ErrorCartStateCopyWith<$Res> {
  __$$ErrorCartStateCopyWithImpl(
      _$ErrorCartState _value, $Res Function(_$ErrorCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorCartState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorCartState implements ErrorCartState {
  const _$ErrorCartState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CartState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorCartState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCartStateCopyWith<_$ErrorCartState> get copyWith =>
      __$$ErrorCartStateCopyWithImpl<_$ErrorCartState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) generateOrderId,
    required TResult Function(String message) error,
    required TResult Function(OrderItem? orderItem, String? message) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? generateOrderId,
    TResult? Function(String message)? error,
    TResult? Function(OrderItem? orderItem, String? message)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? generateOrderId,
    TResult Function(String message)? error,
    TResult Function(OrderItem? orderItem, String? message)? success,
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
    required TResult Function(InitCartState value) init,
    required TResult Function(LoadingCartState value) loading,
    required TResult Function(OrderIdCartState value) generateOrderId,
    required TResult Function(ErrorCartState value) error,
    required TResult Function(LoadedCartState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitCartState value)? init,
    TResult? Function(LoadingCartState value)? loading,
    TResult? Function(OrderIdCartState value)? generateOrderId,
    TResult? Function(ErrorCartState value)? error,
    TResult? Function(LoadedCartState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCartState value)? init,
    TResult Function(LoadingCartState value)? loading,
    TResult Function(OrderIdCartState value)? generateOrderId,
    TResult Function(ErrorCartState value)? error,
    TResult Function(LoadedCartState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCartState implements CartState {
  const factory ErrorCartState(final String message) = _$ErrorCartState;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorCartStateCopyWith<_$ErrorCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedCartStateCopyWith<$Res> {
  factory _$$LoadedCartStateCopyWith(
          _$LoadedCartState value, $Res Function(_$LoadedCartState) then) =
      __$$LoadedCartStateCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderItem? orderItem, String? message});
}

/// @nodoc
class __$$LoadedCartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadedCartState>
    implements _$$LoadedCartStateCopyWith<$Res> {
  __$$LoadedCartStateCopyWithImpl(
      _$LoadedCartState _value, $Res Function(_$LoadedCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderItem = freezed,
    Object? message = freezed,
  }) {
    return _then(_$LoadedCartState(
      freezed == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as OrderItem?,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedCartState implements LoadedCartState {
  const _$LoadedCartState(this.orderItem, this.message);

  @override
  final OrderItem? orderItem;
  @override
  final String? message;

  @override
  String toString() {
    return 'CartState.success(orderItem: $orderItem, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedCartState &&
            (identical(other.orderItem, orderItem) ||
                other.orderItem == orderItem) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderItem, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCartStateCopyWith<_$LoadedCartState> get copyWith =>
      __$$LoadedCartStateCopyWithImpl<_$LoadedCartState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) generateOrderId,
    required TResult Function(String message) error,
    required TResult Function(OrderItem? orderItem, String? message) success,
  }) {
    return success(orderItem, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? generateOrderId,
    TResult? Function(String message)? error,
    TResult? Function(OrderItem? orderItem, String? message)? success,
  }) {
    return success?.call(orderItem, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? generateOrderId,
    TResult Function(String message)? error,
    TResult Function(OrderItem? orderItem, String? message)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(orderItem, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitCartState value) init,
    required TResult Function(LoadingCartState value) loading,
    required TResult Function(OrderIdCartState value) generateOrderId,
    required TResult Function(ErrorCartState value) error,
    required TResult Function(LoadedCartState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitCartState value)? init,
    TResult? Function(LoadingCartState value)? loading,
    TResult? Function(OrderIdCartState value)? generateOrderId,
    TResult? Function(ErrorCartState value)? error,
    TResult? Function(LoadedCartState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCartState value)? init,
    TResult Function(LoadingCartState value)? loading,
    TResult Function(OrderIdCartState value)? generateOrderId,
    TResult Function(ErrorCartState value)? error,
    TResult Function(LoadedCartState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoadedCartState implements CartState {
  const factory LoadedCartState(
      final OrderItem? orderItem, final String? message) = _$LoadedCartState;

  OrderItem? get orderItem;
  String? get message;
  @JsonKey(ignore: true)
  _$$LoadedCartStateCopyWith<_$LoadedCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
