import 'package:bourne_task/models/group.dart';

class TravelRoute {
  final List<int> caravanStops;
  final Group group;
  final Duration waitingTime;

  TravelRoute(this.caravanStops, this.group, this.waitingTime);
}
