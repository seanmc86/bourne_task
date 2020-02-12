import 'package:bourne_task/models/group.dart';

class DataSource {
  static const dataUrl =
      'https://haven-tech-test.s3-eu-west-1.amazonaws.com/tech+test+json.json';
  final client;

  DataSource(this.client);

  Future<List<Group>> fetchData() async {
    try {
      final response = await client.get(dataUrl);
      if (response.statusCode == 200) {
        return groupsFromJson(response.body);
      } else {
        throw Exception('Data error! Response code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Data error! ${e.toString()}');
    }
  }
}
