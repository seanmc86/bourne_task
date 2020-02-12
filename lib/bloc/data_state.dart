import 'package:bourne_task/models/group.dart';
import 'package:super_enum/super_enum.dart';

part 'data_state.g.dart';

@superEnum
enum _DataState {
  @object
  Initial,
  @object
  Loading,
  @Data(fields: [
    DataField<List<Group>>('groups'),
  ])
  Loaded,
  @Data(fields: [
    DataField<String>('message'),
  ])
  Error,
}
