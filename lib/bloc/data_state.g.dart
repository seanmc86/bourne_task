// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DataState extends Equatable {
  const DataState(this._type);

  factory DataState.initial() = Initial;

  factory DataState.loading() = Loading;

  factory DataState.loaded({@required List<Group> groups}) = Loaded;

  factory DataState.error({@required String message}) = Error;

  final _DataState _type;

//ignore: missing_return
  FutureOr<R> when<R>(
      {@required FutureOr<R> Function(Initial) initial,
      @required FutureOr<R> Function(Loading) loading,
      @required FutureOr<R> Function(Loaded) loaded,
      @required FutureOr<R> Function(Error) error}) {
    assert(() {
      if (initial == null ||
          loading == null ||
          loaded == null ||
          error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _DataState.Initial:
        return initial(this as Initial);
      case _DataState.Loading:
        return loading(this as Loading);
      case _DataState.Loaded:
        return loaded(this as Loaded);
      case _DataState.Error:
        return error(this as Error);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(Initial) initial,
      FutureOr<R> Function(Loading) loading,
      FutureOr<R> Function(Loaded) loaded,
      FutureOr<R> Function(Error) error,
      @required FutureOr<R> Function(DataState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _DataState.Initial:
        if (initial == null) break;
        return initial(this as Initial);
      case _DataState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _DataState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _DataState.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(Initial) initial,
      FutureOr<void> Function(Loading) loading,
      FutureOr<void> Function(Loaded) loaded,
      FutureOr<void> Function(Error) error}) {
    assert(() {
      if (initial == null &&
          loading == null &&
          loaded == null &&
          error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DataState.Initial:
        if (initial == null) break;
        return initial(this as Initial);
      case _DataState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _DataState.Loaded:
        if (loaded == null) break;
        return loaded(this as Loaded);
      case _DataState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Initial extends DataState {
  const Initial._() : super(_DataState.Initial);

  factory Initial() {
    _instance ??= Initial._();
    return _instance;
  }

  static Initial _instance;
}

@immutable
class Loading extends DataState {
  const Loading._() : super(_DataState.Loading);

  factory Loading() {
    _instance ??= Loading._();
    return _instance;
  }

  static Loading _instance;
}

@immutable
class Loaded extends DataState {
  const Loaded({@required this.groups}) : super(_DataState.Loaded);

  final List<Group> groups;

  @override
  String toString() => 'Loaded(groups:${this.groups})';
  @override
  List get props => [groups];
}

@immutable
class Error extends DataState {
  const Error({@required this.message}) : super(_DataState.Error);

  final String message;

  @override
  String toString() => 'Error(message:${this.message})';
  @override
  List get props => [message];
}
