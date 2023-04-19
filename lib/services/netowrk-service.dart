import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_guidelines/common/utils/constants.dart';
import 'package:flutter_guidelines/services/network-helper.dart';
import 'package:http/http.dart' as http;

enum RequestType { get, put, post }

class NetworkService {
  const NetworkService._();
  static http.Client? _mockClient;
  static set mockClientSetter(mc) {
    if (StaticValues.isMock) {
      _mockClient = mc;
    } else {
      _mockClient = null;
    }
  }

  static http.Client get _client => _mockClient ?? http.Client();

  static Map<String, String> get getHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  static Future<http.Response>? _createRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    switch (requestType) {
      case RequestType.get:
        return _client.get(uri, headers: headers);
      case RequestType.put:
        return _client.put(uri, headers: headers);
      case RequestType.post:
        var jsonBody = jsonEncode(body);
        return _client.post(
          uri,
          body: jsonBody,
          headers: headers,
        );
      default:
    }
    return null;
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      final _header = getHeaders;
      final _url = NetworkHelper.concatUrlQP(url, queryParam);
      final response = await _createRequest(
          requestType: requestType,
          uri: Uri.parse(_url),
          headers: _header,
          body: body);
      debugPrint('Response : ${response?.headers}');
      return response;
    } catch (e) {
      debugPrint('Error - $e');
      return null;
    }
  }
}
