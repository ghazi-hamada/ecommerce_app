import 'status_request.dart';
import '../constant/app_theme.dart';
import '../constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(AppImageAsset.loading, width: 255.w, height: 255.h),
      );
    } else if (statusRequest == StatusRequest.failure) {
      return const Center(
        child: Center(
          child: Text('No Data'),
        ),
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.server, width: 255.w, height: 255.h),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.offline, width: 255.w, height: 255.h),
      );
    } else {
      return child;
    }
  }
}

class HandlingDataViewRequesst extends StatelessWidget {
  const HandlingDataViewRequesst(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(AppImageAsset.loading, width: 255.w, height: 255.h),
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.server, width: 255.w, height: 255.h),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.offline, width: 255.w, height: 255.h),
      );
    } else {
      return child;
    }
  }
}

class HandlingItems extends StatelessWidget {
  const HandlingItems(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Column(
            children: [
              SizedBox(height: 200.h),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          )
        : statusRequest == StatusRequest.serverfailure
            ? Center(
                child: Lottie.asset(AppImageAsset.server,
                    width: 255.w, height: 255.h),
              )
            : statusRequest == StatusRequest.offlinefailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.offline,
                        width: 255.w, height: 255.h),
                  )
                : child;
  }
}
