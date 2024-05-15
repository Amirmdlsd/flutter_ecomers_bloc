import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_osm_interface/flutter_osm_interface.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late MapController _mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initLocatin();
    _mapController = MapController(
        initPosition: GeoPoint(
            latitude: _locationData?.longitude ?? 0,
            longitude: _locationData?.longitude ?? 0));
  }

  PermissionStatus? _permissionStatus;
  LocationData? _locationData;

  void initLocatin() async {
    try {
      var hasPermission = await Location().hasPermission();
      if (hasPermission == PermissionStatus.granted) {
        _locationData = await Location().getLocation();
        debugPrint(
            "lat:${_locationData?.longitude ?? 0} , long:${_locationData?.longitude ?? 0}");
      } else {
        hasPermission = await Location().requestPermission();
      }
      await _mapController.goToLocation(GeoPoint(
          latitude: _locationData?.longitude ?? 0,
          longitude: _locationData?.longitude ?? 0));

      await _mapController.addMarker(
          GeoPoint(
              latitude: _locationData?.longitude ?? 20,
              longitude: _locationData?.longitude ?? 30),
          markerIcon: const MarkerIcon(
            icon: Icon(
              Icons.circle,
              color: Colors.blue,
              size: 32,
            ),
          ));
    } catch (e) {
      print(e.toString());
    }
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _locationData ==null?
            Center(child: SizedBox(height: 20.h,child: const CircularProgressIndicator(),),)
            :
        OSMFlutter(
            controller: _mapController,
            osmOption: const OSMOption(
                isPicker: true,
                zoomOption: ZoomOption(
                  initZoom: 8.0,
                  maxZoomLevel: 18.0,
                  minZoomLevel: 5,
                ))),
        Positioned(
            bottom: 20.h,
            right: 10.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: IconButton(
                  onPressed: () {
                    initLocatin();
                  },
                  icon: const Icon(Icons.my_location_rounded)),
            ))
      ],
    );
  }
}
