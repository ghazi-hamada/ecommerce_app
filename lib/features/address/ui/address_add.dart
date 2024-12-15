import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../controller/add_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final AddAddressControllerImpl controllerPage =
        Get.put(AddAddressControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: Container(
        child: GetBuilder<AddAddressControllerImpl>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controllerPage.statusRequest,
            child: Column(
              children: [
                controllerPage.kGooglePlex == null
                    ? Container()
                    : Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              markers: Set<Marker>.of(controllerPage.markers),
                              onTap: (argument) =>
                                  controllerPage.addMarker(argument),
                              mapType: MapType.normal,
                              initialCameraPosition:
                                  controllerPage.kGooglePlex!,
                              onMapCreated: (GoogleMapController controller) {
                                controllerPage.completercontroller!
                                    .complete(controller);
                              },
                            ),
                            Positioned(
                              bottom: 20,
                              child: MaterialButton(
                                minWidth: Get.width * 0.6,
                                height: 40.h,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: AppColor.primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  controllerPage.continueAddDetails();
                                },
                                child: const Text("Save Location"),
                              ),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
