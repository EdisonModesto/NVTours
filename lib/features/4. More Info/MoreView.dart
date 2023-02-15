import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// we import our plugin
import 'package:navigation_with_mapbox/navigation_with_mapbox.dart';

import '../../common/AppDrawer.dart';
import '../../common/NvAppBar.dart';
import '../../common/resultsSheet.dart';
import '../../constants/AppColors.dart';
import '../../data/DrawerProvider.dart';
import '../../model/MunicipalityModel.dart';
import '../../viewmodel/MunicipalityViewModel.dart';

class MoreView extends ConsumerStatefulWidget {
  const MoreView({
    required this.spot,
    Key? key,
  }) : super(key: key);


  final Spot spot;
  @override
  ConsumerState createState() => _MoreViewState();
}

class _MoreViewState extends ConsumerState<MoreView> {
  TextEditingController _searchCtrl = TextEditingController();


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

  @override
  Widget build(BuildContext context) {
    final key = ref.watch(Providers().DrawerProviider);
    var muniProvider = ref.watch(municipalityProvider);

    //  var size =  MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: key,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: NvAppBar(DrawerKey: key,)
      ),
      body: muniProvider.when(
          data: (data){
            Map<String, Spot> spot = {};
            for(var i = 0; i < data.municipalities.length; i++){

              print(data.municipalities.values.elementAt(i).spots.keys);
              spot.addAll (data.municipalities.values.elementAt(i).spots);
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
                child: FutureBuilder<List>(
                  future: getLocation(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: AppColors().cardColor,
                                        borderRadius: const BorderRadius.all(Radius.circular(50))
                                    ),
                                    width: 1000,
                                    height: 40,
                                    child: TextField(
                                      controller: _searchCtrl,
                                      onSubmitted: (data){
                                        showMaterialModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            builder: (context){
                                              return ResultsSheet(query: data, spot: spot,);
                                            }
                                        );
                                      },
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                                        hintText: "Search",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.search),
                                      ),
                                    )
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 300,
                                  child: MasonryGridView.count(
                                    itemCount: widget.spot.pictures.length,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2,
                                    crossAxisSpacing: 2,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          showMaterialModalBottomSheet(
                                              context: context,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                              ),
                                              builder: (context){
                                                return SizedBox(
                                                  height: MediaQuery.of(context).size.height * 0.9,
                                                  child: Image.network(
                                                    widget.spot.pictures[index],
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }
                                          );
                                        },
                                        child: Card(
                                          //index: index,
                                          child: Container(
                                            color: AppColors().primary,
                                            height: Random().nextInt(150) + 100.5,
                                            child: Image.network(
                                              widget.spot.pictures[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 1000,
                                      decoration: BoxDecoration(
                                        color: AppColors().cardColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ExpansionTile(
                                          title: Text(
                                            "Tipid Tips",
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          trailing: Icon(Icons.arrow_drop_down_circle_outlined, color: AppColors().primary,),
                                          textColor: AppColors().primary,
                                          childrenPadding: EdgeInsets.zero,
                                          children: List.generate(widget.spot.tips.length, (index){
                                            return Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  widget.spot.tips[index],
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                    width: 1000,
                                    decoration: BoxDecoration(
                                    color: AppColors().cardColor,
                                    borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ExpansionTile(
                                    title: Text(
                                    "Nearby Eateries",
                                    style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    trailing: Icon(Icons.arrow_drop_down_circle_outlined, color: AppColors().primary,),
                                    textColor: AppColors().primary,
                                    childrenPadding: EdgeInsets.zero,
                                    children: List.generate(widget.spot.eateries.length, (index){
                                    return Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                                    child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                    widget.spot.eateries[index].split(",")[0],
                                    style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    ),
                                    ),
                                    ),
                                    IconButton(
                                    onPressed: ()async{
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
                                    latitude: double.parse(widget.spot.eateries[index].split(",")[1]),
                                    longitude:  double.parse(widget.spot.eateries[index].split(",")[2])
                                    ),
                                    // if we enable this option we can choose a destination with a sustained tap
                                    setDestinationWithLongTap: false,
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
                                    },
                                    icon: Icon(Icons.navigation, color: AppColors().primary,)
                                    ),
                                    ],
                                    ),
                                    );
                                    })
                                    ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 60),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child:ElevatedButton(
                              onPressed: ()async{
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
                                        latitude: double.parse(widget.spot.coords.split(",")[0]),
                                        longitude:  double.parse(widget.spot.coords.split(",")[1])
                                    ),
                                    // if we enable this option we can choose a destination with a sustained tap
                                    setDestinationWithLongTap: false,
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
                              },
                              child: Text(
                                "Locate on Map",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors().primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fixedSize: Size(1000, 50),
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                              ),
                            ),
                          ),
                          if (_controlView)
                            MapboxNavigationView(mapboxOptions: _options!),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                ),
              ),
            );
          },
          error: (error, stack){
            return Center(
              child: Text(
                "Error: $error",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          loading: (){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
      drawer: AppDrawer(),
    );
  }
}
