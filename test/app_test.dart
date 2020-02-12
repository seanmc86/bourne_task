import 'package:bourne_task/data_source.dart';
import 'package:bourne_task/models/group.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Client {}

const dataUrl =
    'https://haven-tech-test.s3-eu-west-1.amazonaws.com/tech+test+json.json';

main() {
  group('fetchData', () {
    test('returns List<Group> if the call completes successfully', () async {
      final client = MockClient();
      final dataSource = DataSource(client);
      final mockData = '[{"familyid": 1, "groupsize": 6, "caravan": 5}]';

      when(client.get(dataUrl))
          .thenAnswer((_) async => Response(mockData, 200));

      expect(await dataSource.fetchData(), isInstanceOf<List<Group>>());
    });

    test('throws an exception if the call completes with an error', () {
      final client = MockClient();
      final dataSource = DataSource(client);

      when(client.get(dataUrl))
          .thenAnswer((_) async => Response('Not Found', 404));

      expect(dataSource.fetchData(), throwsException);
    });
  });
}
