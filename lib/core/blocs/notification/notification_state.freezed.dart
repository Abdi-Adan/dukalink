// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Notification>? notifications) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Notification>? notifications)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Notification>? notifications)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitNotificationState value) init,
    required TResult Function(LoadingNotificationState value) loading,
    required TResult Function(ErrorNotificationState value) error,
    required TResult Function(LoadedNotificationState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitNotificationState value)? init,
    TResult? Function(LoadingNotificationState value)? loading,
    TResult? Function(ErrorNotificationState value)? error,
    TResult? Function(LoadedNotificationState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNotificationState value)? init,
    TResult Function(LoadingNotificationState value)? loading,
    TResult Function(ErrorNotificationState value)? error,
    TResult Function(LoadedNotificationState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitNotificationStateCopyWith<$Res> {
  factory _$$InitNotificationStateCopyWith(_$InitNotificationState value,
          $Res Function(_$InitNotificationState) then) =
      __$$InitNotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitNotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$InitNotificationState>
    implements _$$InitNotificationStateCopyWith<$Res> {
  __$$InitNotificationStateCopyWithImpl(_$InitNotificationState _value,
      $Res Function(_$InitNotificationState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitNotificationState implements InitNotificationState {
  const _$InitNotificationState();

  @override
  String toString() {
    return 'NotificationState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitNotificationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Notification>? notifications) success,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Notification>? notifications)? success,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Notification>? notifications)? success,
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
    required TResult Function(InitNotificationState value) init,
    required TResult Function(LoadingNotificationState value) loading,
    required TResult Function(ErrorNotificationState value) error,
    required TResult Function(LoadedNotificationState value) success,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitNotificationState value)? init,
    TResult? Function(LoadingNotificationState value)? loading,
    TResult? Function(ErrorNotificationState value)? error,
    TResult? Function(LoadedNotificationState value)? success,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNotificationState value)? init,
    TResult Function(LoadingNotificationState value)? loading,
    TResult Function(ErrorNotificationState value)? error,
    TResult Function(LoadedNotificationState value)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitNotificationState implements NotificationState {
  const factory InitNotificationState() = _$InitNotificationState;
}

/// @nodoc
abstract class _$$LoadingNotificationStateCopyWith<$Res> {
  factory _$$LoadingNotificationStateCopyWith(_$LoadingNotificationState value,
          $Res Function(_$LoadingNotificationState) then) =
      __$$LoadingNotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$LoadingNotificationState>
    implements _$$LoadingNotificationStateCopyWith<$Res> {
  __$$LoadingNotificationStateCopyWithImpl(_$LoadingNotificationState _value,
      $Res Function(_$LoadingNotificationState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingNotificationState implements LoadingNotificationState {
  const _$LoadingNotificationState();

  @override
  String toString() {
    return 'NotificationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNotificationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Notification>? notifications) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Notification>? notifications)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Notification>? notifications)? success,
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
    required TResult Function(InitNotificationState value) init,
    required TResult Function(LoadingNotificationState value) loading,
    required TResult Function(ErrorNotificationState value) error,
    required TResult Function(LoadedNotificationState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitNotificationState value)? init,
    TResult? Function(LoadingNotificationState value)? loading,
    TResult? Function(ErrorNotificationState value)? error,
    TResult? Function(LoadedNotificationState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNotificationState value)? init,
    TResult Function(LoadingNotificationState value)? loading,
    TResult Function(ErrorNotificationState value)? error,
    TResult Function(LoadedNotificationState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingNotificationState implements NotificationState {
  const factory LoadingNotificationState() = _$LoadingNotificationState;
}

/// @nodoc
abstract class _$$ErrorNotificationStateCopyWith<$Res> {
  factory _$$ErrorNotificationStateCopyWith(_$ErrorNotificationState value,
          $Res Function(_$ErrorNotificationState) then) =
      __$$ErrorNotificationStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorNotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$ErrorNotificationState>
    implements _$$ErrorNotificationStateCopyWith<$Res> {
  __$$ErrorNotificationStateCopyWithImpl(_$ErrorNotificationState _value,
      $Res Function(_$ErrorNotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorNotificationState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorNotificationState implements ErrorNotificationState {
  const _$ErrorNotificationState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorNotificationState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorNotificationStateCopyWith<_$ErrorNotificationState> get copyWith =>
      __$$ErrorNotificationStateCopyWithImpl<_$ErrorNotificationState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Notification>? notifications) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Notification>? notifications)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Notification>? notifications)? success,
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
    required TResult Function(InitNotificationState value) init,
    required TResult Function(LoadingNotificationState value) loading,
    required TResult Function(ErrorNotificationState value) error,
    required TResult Function(LoadedNotificationState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitNotificationState value)? init,
    TResult? Function(LoadingNotificationState value)? loading,
    TResult? Function(ErrorNotificationState value)? error,
    TResult? Function(LoadedNotificationState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNotificationState value)? init,
    TResult Function(LoadingNotificationState value)? loading,
    TResult Function(ErrorNotificationState value)? error,
    TResult Function(LoadedNotificationState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorNotificationState implements NotificationState {
  const factory ErrorNotificationState(final String message) =
      _$ErrorNotificationState;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorNotificationStateCopyWith<_$ErrorNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedNotificationStateCopyWith<$Res> {
  factory _$$LoadedNotificationStateCopyWith(_$LoadedNotificationState value,
          $Res Function(_$LoadedNotificationState) then) =
      __$$LoadedNotificationStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Notification>? notifications});
}

/// @nodoc
class __$$LoadedNotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$LoadedNotificationState>
    implements _$$LoadedNotificationStateCopyWith<$Res> {
  __$$LoadedNotificationStateCopyWithImpl(_$LoadedNotificationState _value,
      $Res Function(_$LoadedNotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = freezed,
  }) {
    return _then(_$LoadedNotificationState(
      freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
    ));
  }
}

/// @nodoc

class _$LoadedNotificationState implements LoadedNotificationState {
  const _$LoadedNotificationState(final List<Notification>? notifications)
      : _notifications = notifications;

  final List<Notification>? _notifications;
  @override
  List<Notification>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NotificationState.success(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedNotificationState &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedNotificationStateCopyWith<_$LoadedNotificationState> get copyWith =>
      __$$LoadedNotificationStateCopyWithImpl<_$LoadedNotificationState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Notification>? notifications) success,
  }) {
    return success(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Notification>? notifications)? success,
  }) {
    return success?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Notification>? notifications)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitNotificationState value) init,
    required TResult Function(LoadingNotificationState value) loading,
    required TResult Function(ErrorNotificationState value) error,
    required TResult Function(LoadedNotificationState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitNotificationState value)? init,
    TResult? Function(LoadingNotificationState value)? loading,
    TResult? Function(ErrorNotificationState value)? error,
    TResult? Function(LoadedNotificationState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNotificationState value)? init,
    TResult Function(LoadingNotificationState value)? loading,
    TResult Function(ErrorNotificationState value)? error,
    TResult Function(LoadedNotificationState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoadedNotificationState implements NotificationState {
  const factory LoadedNotificationState(
      final List<Notification>? notifications) = _$LoadedNotificationState;

  List<Notification>? get notifications;
  @JsonKey(ignore: true)
  _$$LoadedNotificationStateCopyWith<_$LoadedNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
