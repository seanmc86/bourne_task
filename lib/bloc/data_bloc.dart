import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bourne_task/data_source.dart';

import 'data_state.dart';
import 'data_event.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataState.initial();

  DataBloc(this.dataSource);

  final DataSource dataSource;

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is FetchData) {
      yield DataState.loading();
      final response = await dataSource.fetchData();
      yield* response.fold((failure) async* {
        yield DataState.error(message: failure.message);
      }, (data) async* {
        yield DataState.loaded(groups: data);
      });
    }
  }
}
