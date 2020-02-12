import 'package:bourne_task/models/failure.dart';
import 'package:bourne_task/models/group.dart';
import 'package:dartz/dartz.dart';

class DataSource {
  static const dataUrl =
      'https://haven-tech-test.s3-eu-west-1.amazonaws.com/tech+test+json.json';
  final client;

  DataSource(this.client);

  Future<Either<Failure, List<Group>>> fetchData() async {
    try {
      final response = await client.get(dataUrl);
      if (response.statusCode == 200) {
        return Right(groupsFromJson(response.body));
      } else {
        throw Left('Data error! Response code: ${response.statusCode}');
      }
    } catch (e) {
      throw Left('Data error! ${e.toString()}');
    }
  }
}
