
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/order_details_controller.dart';

Widget buildMapView(OrderDetailsControllerImpl controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: GoogleMap(
        mapType: MapType.normal,
        markers: controller.markers.toSet(),
        initialCameraPosition: controller.cameraPosition!,
        onMapCreated: (GoogleMapController googleMapController) {
          controller.completercontroller!.complete(googleMapController);
        },
      ),
    );
  }