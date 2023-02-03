import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
// we import our plugin
import 'package:navigation_with_mapbox/navigation_with_mapbox.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {

  // Only android
  final _navigationWithMapboxPlugin = NavigationWithMapbox();
  // Variable for Navigation Map Options
  MapboxOptions? _options;
  // Variables Stream to listen for events
  late Stream<int> listenEvents;
  late StreamSubscription _statusViewSubscription;
  // Control variable for map widget
  bool _controlView = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    // we instantiate the stream getStateMapboxView IOS
    listenEvents = MapboxNavigationView.getStateMapboxView;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  Future<List<double?>> getLocation()async{
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print('Location service is not enabled');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('Location permissions are not granted');
      }
    }

    _locationData = await location.getLocation();
    return [_locationData.longitude, _locationData.latitude];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<List>(
                            future: getLocation(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                return ElevatedButton(
                                  onPressed: io.Platform.isAndroid
                                      ? () async {
                                    // start navigation
                                    await _navigationWithMapboxPlugin
                                        .startNavigation(
                                      // origin refers to the user's starting point at the time of starting the navigation
                                        origin: WayPoint(
                                            latitude: snapshot.data![1],
                                            longitude: snapshot.data![0]
                                        ),
                                        // destination refers to the end point or goal for the user at the time of starting the navigation
                                        destination: WayPoint(
                                            latitude: 16.6172821,
                                            longitude: 123.9877889
                                        ),
                                        // if we enable this option we can choose a destination with a sustained tap
                                        setDestinationWithLongTap: true,
                                        // if we enable this option we will activate the simulation of the route
                                        simulateRoute: false,
                                        // if we enable this option we can see alternative routes when starting the navigation map ONLY ANDROID
                                        // optional, default: false
                                        alternativeRoute: false,
                                        // the style or theme with which the navigation map will be loaded
                                        // optional, default: streets, others: dark, light, traffic_day, traffic_night, satellite, satellite_streets, outdoors
                                        style: 'traffic_night',
                                        language: 'en',
                                        // refers to the navigation mode, the route and time will be calculated depending on this
                                        // optional, default: driving, others: walking, cycling
                                        profile: 'driving',
                                        // unit of measure in which the navigation assistant will speak to us
                                        // optional, default: metric
                                        voiceUnits: 'imperial',
                                        // optional, message that will be displayed when starting the navigation map ONLY ANDROID
                                        msg:
                                        'Path Found!');
                                    }
                                      : null,
                                  child: const Text('Open Map'),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            }
                          ),
                        ],
                      ),
                    ),
                    // When the condition is met we show the navigation map with mapbox
                    if (_controlView)
                      MapboxNavigationView(mapboxOptions: _options!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // function that listens to the state of the map
  _statusView(event) {
    // when we close the map we go to hide the view of the map and stop listening to its state
    if (event == 2) {
      // we hide the map view
      setState(() {
        _controlView = false;
      });
      // we stopped listening to the state of the map
      _statusViewSubscription.cancel();
    }
  }
}
