import 'dart:async';

import '../../../core/class/status_request.dart';
import '../../../routes_app.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressController extends GetxController {
  Completer<GoogleMapController>? completercontroller;
  Position? position;
  StatusRequest statusRequest = StatusRequest.loading;
  CameraPosition? kGooglePlex;
  List<Marker> markers = <Marker>[];
  double? lat;
  double? long;
  addMarker(LatLng latLng);
  continueAddDetails();
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
