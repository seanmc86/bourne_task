import 'package:bloc_test/bloc_test.dart';
import 'package:bourne_task/bloc/data_bloc.dart';
import 'package:bourne_task/bloc/data_event.dart';
import 'package:bourne_task/bloc/data_state.dart';
import 'package:bourne_task/data_source.dart';
import 'package:bourne_task/models/failure.dart';
import 'package:bourne_task/models/group.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataSource extends Mock implements DataSource {}

void main() {
  MockDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockDataSource();
  });
  group('FetchData', () {
    final Either<Failure, List<Group>> successResponse =
        Right([Group(caravan: 1, groupsize: 1, familyid: 1)]);
    final Either<Failure, List<Group>> errorResponse =
        Left(Failure(message: 'Failed to get data'));
    String errorMessage;
    List<Group> groups;
    successResponse.fold((failure) => errorMessage = failure.message,
        (response) => groups = response);
    errorResponse.fold((failure) => errorMessage = failure.message,
        (response) => groups = response);

    blocTest(
      'emits [Loading], [Loaded] when successfully called',
      build: () {
        when(mockDataSource.fetchData())
            .thenAnswer((_) async => successResponse);
        return DataBloc(mockDataSource);
      },
      act: (bloc) => bloc.add(DataEvent.fetchData()),
      expect: [
        DataState.initial(),
        DataState.loading(),
        DataState.loaded(groups: groups)
      ],
    );

    blocTest(
      'emits [Loading], [Error] when unsuccessfully called',
      build: () {
        when(mockDataSource.fetchData()).thenAnswer((_) async => errorResponse);
        return DataBloc(mockDataSource);
      },
      act: (bloc) => bloc.add(DataEvent.fetchData()),
      expect: [
        DataState.initial(),
        DataState.loading(),
        DataState.error(message: errorMessage)
      ],
    );
  });
}
