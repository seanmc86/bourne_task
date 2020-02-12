// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class DataEvent extends Equatable {
  const DataEvent(this._type);

  factory DataEvent.fetchData() = FetchData;

  final _DataEvent _type;

//ignore: missing_return
  FutureOr<R> when<R>({@required FutureOr<R> Function(FetchData) fetchData}) {
    assert(() {
      if (fetchData == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _DataEvent.FetchData:
        return fetchData(this as FetchData);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(FetchData) fetchData,
      @required FutureOr<R> Function(DataEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _DataEvent.FetchData:
        if (fetchData == null) break;
        return fetchData(this as FetchData);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial({FutureOr<void> Function(FetchData) fetchData}) {
    assert(() {
      if (fetchData == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _DataEvent.FetchData:
        if (fetchData == null) break;
        return fetchData(this as FetchData);
    }
  }

  @override
  List get props => const [];
}

@immutable
class FetchData extends DataEvent {
  const FetchData._() : super(_DataEvent.FetchData);

  factory FetchData() {
    _instance ??= FetchData._();
    return _instance;
  }

  static FetchData _instance;
}
