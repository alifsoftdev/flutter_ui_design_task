import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_design_task/const/appColor.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../const/appStyle.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  /// Google Map Shows
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  LatLng _center = LatLng(0.0, 0.0);

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  GoogleMapController? mapController;
  Set<Marker> _markers = Set<Marker>();

  @override
  void initState() {
    getLocation();
    _addCustomMarker();
    super.initState();
  }


  void _addCustomMarker() async {
    ByteData data = await rootBundle.load("assets/custom_marker.png");
    List<int> byteList = data.buffer.asUint8List();
    Uint8List uint8List =
    Uint8List.fromList(byteList); // Convert List<int> to Uint8List
    BitmapDescriptor customIcon = BitmapDescriptor.fromBytes(uint8List);
    setState(() {
      // Add the marker to the set
      _markers.add(
        Marker(
          markerId: MarkerId("customMarker"),
          position: LatLng(_locationData!.latitude!, _locationData!.latitude!),
          icon: customIcon,
          infoWindow: InfoWindow(title: 'Custom Marker'),
        ),
      );
    });
  }

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    setState(() {});
    print('get current location');
    print(_locationData);
    _center = LatLng(_locationData!.latitude!, _locationData!.longitude!);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              child: _locationData != null
                  ? Stack(
                children: [
                  GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    compassEnabled: true,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    scrollGesturesEnabled: true,
                    mapToolbarEnabled: false,
                    rotateGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 12.0,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      _addCustomMarker();
                      mapController = controller;
                      getLocation();
                    },
                    markers: _markers,
                  ),
                  Positioned(
                    bottom: 180.h,
                    right: 16.0.w,
                    child: FloatingActionButton(
                      onPressed: () async {
                        getLocation();
                        mapController!
                            .animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: _center,
                            zoom: 15.0,
                          ),
                        ));
                      },
                      child: Icon(Icons.my_location),
                    ),
                  ),
                ],
              )
                  : const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            Positioned(
                top: 40.h,
                child: SizedBox(
                  width: 370.w,
                  height: 36.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Expanded(
                        child: Container(
                          height: 36.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search_outlined),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 12.h),
                                fillColor: Colors.white,
                                enabledBorder: InputBorder.none,
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                disabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Search"),
                          ),
                        ),
                      ),
                      addW(10.w),
                      InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          backgroundColor: AppColor.white,
                          child: Image.asset(
                              "assets/profile.png"),

                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
