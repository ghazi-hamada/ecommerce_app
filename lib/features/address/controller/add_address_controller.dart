import 'dart:async';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressController extends GetxController {
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  StatusRequest statusRequest = StatusRequest.loading;
  CameraPosition? kGooglePlex;
  List<Marker> markers = <Marker>[];
  addMarker(LatLng latLng);
  continueAddDetails();
  double? lat;
  double? long;
}

class AddAddressControllerImpl extends AddAddressController {
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  addMarker(latLng) {
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId('1'),
      position: latLng,
      infoWindow: const InfoWindow(title: 'Your Location'),
      icon: BitmapDescriptor.defaultMarker,
    ));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  continueAddDetails() {
    Get.toNamed(AppRoutes.kAddressAddDetails,
        arguments: {'lat': lat.toString(), 'long': long.toString()});
  }
}
