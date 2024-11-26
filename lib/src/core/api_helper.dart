import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import '/src/common/constants/static_data.dart';

class ApiHelper {
  final Duration _timeoutDuration = const Duration(seconds: 30);

  /// [Get] - [Request]
  /// Send a get request to api.
  Future<Response> getRequest(
      {required String endpoint, String? authToken}) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer ${authToken ?? StaticData.accessToken}',
      'Content-Type': 'application/json',
    };

    log('REQUEST TO : $endpoint');
    log('Headers: $headers');
    try {
      final Response response = await get(Uri.parse(endpoint), headers: headers)
          .timeout(_timeoutDuration);
      return response;
    } catch (e, stackTrace) {
      log('Error while GET request: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// [Post] - [Request]
  /// Send a post request to api.
  Future<Response> postRequest({
    required String endpoint,
    dynamic data,
    required String? authToken,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    log('REQUEST TO : $endpoint');
    log('Headers: $headers');

    try {
      final Response response = await post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(data),
      ).timeout(_timeoutDuration);

      log('RESPONSE: ${response.statusCode} ${response.body}');
      return response;
    } catch (e, stackTrace) {
      log('Error during POST request: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// [Post]-[File] - [Request]
  /// Post multiple files along with data.
  /// [fileJsonKey] is the key for the file/image in api.
  Future<StreamedResponse> postFilesWithDataRequest({
    required String endpoint,
    required String fileJsonKey,
    required List<File> files,
    required Map<String, String>? data,
  }) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer ${StaticData.accessToken}',
      'Content-Type': 'multipart/form-data',
    };

    log('REQUEST TO : $endpoint');
    log('Headers: $headers');

    try {
      final request = MultipartRequest(
        'POST',
        Uri.parse(endpoint),
      );
      request.headers.addEntries(headers.entries);
      for (File file in files) {
        var filename = file.path.split("/").last;

        request.files.add(await MultipartFile.fromPath(fileJsonKey, file.path,
            filename: filename));
      }
      if (data != null) {
        request.fields.addEntries(data.entries);
      }
      final response = await request.send();
      return response;
    } catch (e, stackTrace) {
      log('Error during POST request: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// [Patch] - [Request]
  /// Patch request for updating a value
  Future<Response> patchRequest(
      {required String endpoint, dynamic data}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${StaticData.accessToken}',
    };

    log('REQUEST TO : $endpoint');
    log('Headers: $headers');
    try {
      Response response = await patch(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(data),
      ).timeout(_timeoutDuration);

      log('RESPONSE: ${response.statusCode} ${response.body}');

      return response;
    } catch (e, stackTrace) {
      log('Error during PATCH request: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// [Delete] - [Request]
  /// Delete request for deleting or removing data.
  Future<Response> deleteRequest({required String endpoint}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${StaticData.accessToken}',
    };

    log('REQUEST TO : $endpoint');
    log('Headers: $headers');
    try {
      Response response = await delete(
        Uri.parse(endpoint),
        headers: headers,
      ).timeout(_timeoutDuration);

      log('RESPONSE: ${response.statusCode} ${response.body}');

      return response;
    } catch (e, stackTrace) {
      log('Error during DELETE request: $e', stackTrace: stackTrace);
      rethrow;
    }
  }
}
