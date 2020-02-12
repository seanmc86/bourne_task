import 'package:bourne_task/bloc/data_bloc.dart';
import 'package:bourne_task/bloc/data_state.dart';
import 'package:bourne_task/bloc/data_event.dart';
import 'package:bourne_task/constants.dart';
import 'package:bourne_task/data_source.dart';
import 'package:bourne_task/models/group.dart';
import 'package:bourne_task/models/travel_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

final dataSource = DataSource(Client());
final dataBloc = DataBloc(dataSource);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: BlocProvider<DataBloc>(
          create: (context) => dataBloc..add(DataEvent.fetchData()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<DataBloc, DataState>(
                builder: (context, state) {
                  // States of the FetchData event, all required to be handled
                  return state.when(
                      initial: (_) => Text('No data yet...'),
                      loading: (_) => CircularProgressIndicator(),
                      loaded: (data) => _dataResultList(data.groups),
                      error: (e) => Text(e.message));
                },
              ),
              RaisedButton(
                child: Text('Fetch data again'),
                onPressed: () => dataBloc.add(DataEvent.fetchData()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataResultList(List<Group> groups) {
    List<TravelRoute> _routes = List<TravelRoute>();
    int minutesWaited = 0;

    // We can simply loop through the list of groups in the order presented to us
    // as there is no preference on timing efficiency and group size
    for (var i = 0; i < groups.length; i++) {
      final group = groups[i];

      // Get the list of stops for this caravanid
      final travelStops = caravanRouteMap[group.caravan];

      // Waiting time for the route is calculated as:
      // Time to travel from the gate to the destination caravan + time waited at the gate for previous families
      // Time to travel from gate to first stop is also assumed to be 1min
      _routes.add(TravelRoute(travelStops, group,
          Duration(minutes: travelStops.length + minutesWaited)));

      // Add waiting time only after the first family is finished
      minutesWaited += travelStops.length;
    }

    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.black,
              ),
          itemCount: _routes.length,
          itemBuilder: (context, index) => Column(
                children: <Widget>[
                  Text(
                      'Group of familyid: ${_routes[index].group.familyid}, caravanid: ${_routes[index].group.caravan}'),
                  Text(
                      'Waiting minutes until arrival at caravan: ${_routes[index].waitingTime.inMinutes}'),
                  Text('Route taken:'),
                  for (var stop in _routes[index].caravanStops)
                    Text(stop.toString())
                ],
              )),
    );
  }
}
