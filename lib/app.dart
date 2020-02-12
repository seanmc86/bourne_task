/// Libaries used:
/// http - async http calls, easy to plug in Client for testing and less boilerplate than other packages
/// mockito - gives the ability to mock a dependency, and fake the http calls and responses

import 'package:bourne_task/constants.dart';
import 'package:bourne_task/data_source.dart';
import 'package:bourne_task/models/travel_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dataSource = DataSource(Client());
  List<TravelRoute> routes = List<TravelRoute>();
  String error;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    dataSource.fetchData().then((groups) {
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
      setState(() {
        routes = _routes;
        error = null;
      });
    }).catchError((e) => setState(() => error = e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _dataResultList(),
            RaisedButton(
              child: Text('Fetch data again'),
              onPressed: () => _fetchData(),
            ),
            Text('Error: $error'),
          ],
        ),
      ),
    );
  }

  Widget _dataResultList() {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.black,
              ),
          itemCount: routes.length,
          itemBuilder: (context, index) => Column(
                children: <Widget>[
                  Text(
                      'Group of familyid: ${routes[index].group.familyid}, caravanid: ${routes[index].group.caravan}'),
                  Text(
                      'Waiting minutes until arrival at caravan: ${routes[index].waitingTime.inMinutes}'),
                  Text('Route taken:'),
                  for (var stop in routes[index].caravanStops)
                    Text(stop.toString())
                ],
              )),
    );
  }
}
