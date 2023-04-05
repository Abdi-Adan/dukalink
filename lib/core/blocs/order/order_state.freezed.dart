// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(List<NewOrders>? orderList, NewOrders? order)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(List<NewOrders>? orderList, NewOrders? order)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(List<NewOrders>? orderList, NewOrders? order)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitOrderState value) init,
    required TResult Function(LoadingOrderState value) loading,
    required TResult Function(ErrorOrderState value) error,
    required TResult Function(OrderStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderState value)? init,
    TResult? Function(LoadingOrderState value)? loading,
    TResult? Function(ErrorOrderState value)? error,
    TResult? Function(OrderStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderState value)? init,
    TResult Function(LoadingOrderState value)? loading,
    TResult Function(ErrorOrderState value)? error,
    TResult Function(OrderStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitOrderStateCopyWith<$Res> {
  factory _$$InitOrderStateCopyWith(
          _$InitOrderState value, $Res Function(_$InitOrderState) then) =
      __$$InitOrderStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitOrderStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$InitOrderState>
    implements _$$InitOrderStateCopyWith<$Res> {
  __$$InitOrderStateCopyWithImpl(
      _$InitOrderState _value, $Res Function(_$InitOrderState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitOrderState implements InitOrderState {
  const _$InitOrderState();

  @override
  String toString() {
    return 'OrderState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitOrderState);
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
    required TResult Function(List<NewOrders>? orderList, NewOrders? order)
        success,
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
    TResult? Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    TResult Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    required TResult Function(InitOrderState value) init,
    required TResult Function(LoadingOrderState value) loading,
    required TResult Function(ErrorOrderState value) error,
    required TResult Function(OrderStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderState value) success,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderState value)? init,
    TResult? Function(LoadingOrderState value)? loading,
    TResult? Function(ErrorOrderState value)? error,
    TResult? Function(OrderStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderState value)? success,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderState value)? init,
    TResult Function(LoadingOrderState value)? loading,
    TResult Function(ErrorOrderState value)? error,
    TResult Function(OrderStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderState value)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitOrderState implements OrderState {
  const factory InitOrderState() = _$InitOrderState;
}

/// @nodoc
abstract class _$$LoadingOrderStateCopyWith<$Res> {
  factory _$$LoadingOrderStateCopyWith(
          _$LoadingOrderState value, $Res Function(_$LoadingOrderState) then) =
      __$$LoadingOrderStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingOrderStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$LoadingOrderState>
    implements _$$LoadingOrderStateCopyWith<$Res> {
  __$$LoadingOrderStateCopyWithImpl(
      _$LoadingOrderState _value, $Res Function(_$LoadingOrderState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingOrderState implements LoadingOrderState {
  const _$LoadingOrderState();

  @override
  String toString() {
    return 'OrderState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingOrderState);
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
    required TResult Function(List<NewOrders>? orderList, NewOrders? order)
        success,
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
    TResult? Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    TResult Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    required TResult Function(InitOrderState value) init,
    required TResult Function(LoadingOrderState value) loading,
    required TResult Function(ErrorOrderState value) error,
    required TResult Function(OrderStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderState value)? init,
    TResult? Function(LoadingOrderState value)? loading,
    TResult? Function(ErrorOrderState value)? error,
    TResult? Function(OrderStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderState value)? init,
    TResult Function(LoadingOrderState value)? loading,
    TResult Function(ErrorOrderState value)? error,
    TResult Function(OrderStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingOrderState implements OrderState {
  const factory LoadingOrderState() = _$LoadingOrderState;
}

/// @nodoc
abstract class _$$ErrorOrderStateCopyWith<$Res> {
  factory _$$ErrorOrderStateCopyWith(
          _$ErrorOrderState value, $Res Function(_$ErrorOrderState) then) =
      __$$ErrorOrderStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorOrderStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$ErrorOrderState>
    implements _$$ErrorOrderStateCopyWith<$Res> {
  __$$ErrorOrderStateCopyWithImpl(
      _$ErrorOrderState _value, $Res Function(_$ErrorOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorOrderState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorOrderState implements ErrorOrderState {
  const _$ErrorOrderState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrderState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorOrderState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorOrderStateCopyWith<_$ErrorOrderState> get copyWith =>
      __$$ErrorOrderStateCopyWithImpl<_$ErrorOrderState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(List<NewOrders>? orderList, NewOrders? order)
        success,
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
    TResult? Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    TResult Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    required TResult Function(InitOrderState value) init,
    required TResult Function(LoadingOrderState value) loading,
    required TResult Function(ErrorOrderState value) error,
    required TResult Function(OrderStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderState value)? init,
    TResult? Function(LoadingOrderState value)? loading,
    TResult? Function(ErrorOrderState value)? error,
    TResult? Function(OrderStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderState value)? init,
    TResult Function(LoadingOrderState value)? loading,
    TResult Function(ErrorOrderState value)? error,
    TResult Function(OrderStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorOrderState implements OrderState {
  const factory ErrorOrderState(final String message) = _$ErrorOrderState;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorOrderStateCopyWith<_$ErrorOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderStatusOrderStateCopyWith<$Res> {
  factory _$$OrderStatusOrderStateCopyWith(_$OrderStatusOrderState value,
          $Res Function(_$OrderStatusOrderState) then) =
      __$$OrderStatusOrderStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$OrderStatusOrderStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStatusOrderState>
    implements _$$OrderStatusOrderStateCopyWith<$Res> {
  __$$OrderStatusOrderStateCopyWithImpl(_$OrderStatusOrderState _value,
      $Res Function(_$OrderStatusOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$OrderStatusOrderState(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderStatusOrderState implements OrderStatusOrderState {
  const _$OrderStatusOrderState(this.status);

  @override
  final String status;

  @override
  String toString() {
    return 'OrderState.orderStatus(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusOrderState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusOrderStateCopyWith<_$OrderStatusOrderState> get copyWith =>
      __$$OrderStatusOrderStateCopyWithImpl<_$OrderStatusOrderState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(List<NewOrders>? orderList, NewOrders? order)
        success,
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
    TResult? Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    TResult Function(List<NewOrders>? orderList, NewOrders? order)? success,
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
    required TResult Function(InitOrderState value) init,
    required TResult Function(LoadingOrderState value) loading,
    required TResult Function(ErrorOrderState value) error,
    required TResult Function(OrderStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderState value) success,
  }) {
    return orderStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderState value)? init,
    TResult? Function(LoadingOrderState value)? loading,
    TResult? Function(ErrorOrderState value)? error,
    TResult? Function(OrderStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderState value)? success,
  }) {
    return orderStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderState value)? init,
    TResult Function(LoadingOrderState value)? loading,
    TResult Function(ErrorOrderState value)? error,
    TResult Function(OrderStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderState value)? success,
    required TResult orElse(),
  }) {
    if (orderStatus != null) {
      return orderStatus(this);
    }
    return orElse();
  }
}

abstract class OrderStatusOrderState implements OrderState {
  const factory OrderStatusOrderState(final String status) =
      _$OrderStatusOrderState;

  String get status;
  @JsonKey(ignore: true)
  _$$OrderStatusOrderStateCopyWith<_$OrderStatusOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedOrderStateCopyWith<$Res> {
  factory _$$LoadedOrderStateCopyWith(
          _$LoadedOrderState value, $Res Function(_$LoadedOrderState) then) =
      __$$LoadedOrderStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NewOrders>? orderList, NewOrders? order});
}

/// @nodoc
class __$$LoadedOrderStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$LoadedOrderState>
    implements _$$LoadedOrderStateCopyWith<$Res> {
  __$$LoadedOrderStateCopyWithImpl(
      _$LoadedOrderState _value, $Res Function(_$LoadedOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderList = freezed,
    Object? order = freezed,
  }) {
    return _then(_$LoadedOrderState(
      freezed == orderList
          ? _value._orderList
          : orderList // ignore: cast_nullable_to_non_nullable
              as List<NewOrders>?,
      freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as NewOrders?,
    ));
  }
}

/// @nodoc

class _$LoadedOrderState implements LoadedOrderState {
  const _$LoadedOrderState(final List<NewOrders>? orderList, this.order)
      : _orderList = orderList;

  final List<NewOrders>? _orderList;
  @override
  List<NewOrders>? get orderList {
    final value = _orderList;
    if (value == null) return null;
    if (_orderList is EqualUnmodifiableListView) return _orderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NewOrders? order;

  @override
  String toString() {
    return 'OrderState.success(orderList: $orderList, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedOrderState &&
            const DeepCollectionEquality()
                .equals(other._orderList, _orderList) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_orderList), order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedOrderStateCopyWith<_$LoadedOrderState> get copyWith =>
      __$$LoadedOrderStateCopyWithImpl<_$LoadedOrderState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String status) orderStatus,
    required TResult Function(List<NewOrders>? orderList, NewOrders? order)
        success,
  }) {
    return success(orderList, order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String status)? orderStatus,
    TResult? Function(List<NewOrders>? orderList, NewOrders? order)? success,
  }) {
    return success?.call(orderList, order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String status)? orderStatus,
    TResult Function(List<NewOrders>? orderList, NewOrders? order)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(orderList, order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitOrderState value) init,
    required TResult Function(LoadingOrderState value) loading,
    required TResult Function(ErrorOrderState value) error,
    required TResult Function(OrderStatusOrderState value) orderStatus,
    required TResult Function(LoadedOrderState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitOrderState value)? init,
    TResult? Function(LoadingOrderState value)? loading,
    TResult? Function(ErrorOrderState value)? error,
    TResult? Function(OrderStatusOrderState value)? orderStatus,
    TResult? Function(LoadedOrderState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitOrderState value)? init,
    TResult Function(LoadingOrderState value)? loading,
    TResult Function(ErrorOrderState value)? error,
    TResult Function(OrderStatusOrderState value)? orderStatus,
    TResult Function(LoadedOrderState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoadedOrderState implements OrderState {
  const factory LoadedOrderState(
          final List<NewOrders>? orderList, final NewOrders? order) =
      _$LoadedOrderState;

  List<NewOrders>? get orderList;
  NewOrders? get order;
  @JsonKey(ignore: true)
  _$$LoadedOrderStateCopyWith<_$LoadedOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
