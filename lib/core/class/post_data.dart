import 'dart:convert';
import 'dart:developer';
import 'dart:io'; // لإدارة الملفات

import 'package:dartz/dartz.dart'; // استيراد مكتبة dartz
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:http/http.dart' as http;

import 'crud.dart';

class PostData {
  Crud crud;
  PostData(this.crud);

  Future<Either<StatusRequest, Map>> postData({
    required String linkurl,
    required Map<String, dynamic> data,
    File? file, // دعم رفع الملفات
  }) async {
    try {
      if (file != null) {
        // إذا كان هناك ملف، استخدم MultipartRequest
        var uri = Uri.parse(linkurl);
        var request = http.MultipartRequest('POST', uri);

        // إضافة الملف
        request.files.add(
          await http.MultipartFile.fromPath(
            'files', // اسم المفتاح المستخدم في PHP
            file.path,
          ),
        );

        // إضافة البيانات الأخرى
        data.forEach((key, value) {
          request.fields[key] = value.toString();
        });

        // إرسال الطلب
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        // تحويل الاستجابة إلى خريطة (Map) وفحص المفتاح 'status'
        if (response.statusCode == 200) {
          var responseMap = jsonDecode(response.body);

          // تحقق من قيمة 'status'
          if (responseMap['status'] == 'success') {
            return Right(responseMap); // إذا كانت الاستجابة ناجحة
          } else {
            return const Left(
                StatusRequest.failure); // إذا كانت الاستجابة فاشلة
          }
        } else {
          return const Left(StatusRequest.serverException);
        }
      } else {
        // إذا لم يكن هناك ملف، استخدم الطلب العادي
        Either<StatusRequest, Map<String, dynamic>> response =
            await crud.postData(linkurl, data);

        return response.fold(
          (l) => const Left(StatusRequest.failure), // إذا كان هناك خطأ
          (r) => Right(r), // إذا كانت الاستجابة ناجحة
        );
      }
    } catch (e) {
      log("Error: $e");
      return const Left(StatusRequest.serverException);
    }
  }
}
