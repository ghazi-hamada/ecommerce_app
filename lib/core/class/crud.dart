import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dartz/dartz.dart';
import 'status_request.dart';
import '../functions/check_internet.dart';
import 'package:http/http.dart' as http;


class Crud {
  final Dio _dio;

  Crud()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            responseType: ResponseType.json,
          ),
        ) {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false, // Response headers are often not needed.
        responseBody: true,
        compact: true, // Keeps logs concise.
        maxWidth: 120, // Adjust width for better readability.
      ),
    );
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
    String linkUrl,
    Map<String, dynamic> data,
  ) async {
    log("Request Data: ${jsonEncode(data)}", name: "POST Request");

    if (!await checkInternet()) {
      return const Left(
        StatusRequest.offlinefailure,
      );
    }

    try {
      final response = await _dio.post(
        linkUrl,
        data: FormData.fromMap(data),
        options: Options(headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        }),
      );
      final responseData = jsonDecode(response.data);

      if (responseData['status'] == 'success') {
        log("Response Data: $responseData", name: "Response");
      }

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data);

        if (responseData['status'] == 'success') {
          return Right(responseData);
        }
        return Left(responseData['message'] ?? "حدث خطأ غير متوقع.");
      }

      return const Left(StatusRequest.failure);
    } on DioException catch (e) {
      log("DioError: ${e.message}", name: "DioException");
      log("DioError Data: ${e.response?.data}", name: "DioException");
      return const Left(StatusRequest.serverException);
    } catch (e, stackTrace) { 
      return const Left(StatusRequest.serverException);
    }
  }

 
}
