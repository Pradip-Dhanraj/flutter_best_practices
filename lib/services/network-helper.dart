import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_guidelines/services/network-enum.dart';
import 'package:flutter_guidelines/services/network_typedef.dart';

class NetworkHelper {
  static String concatUrlQP(String url, Map<String, String>? queryParameters) {
    if (url.isEmpty) return url;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }

  static R filterResponse<R>(
      {required NetworkCallBack callBack,
      required http.Response? response,
      required NetworkOnFailureCallBackWithMessage onFailureCallBackWithMessage,
      CallBackParameterName parameterName = CallBackParameterName.all}) {
    try {
      if (response == null || response.body.isEmpty) {
        return onFailureCallBackWithMessage(
            NetworkResponseErrorType.responseEmpty, 'empty response');
      }

      var json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // if (_isValidResponse(json)) {
        //   return callBack(parameterName.getJson(json));
        // }
      } else if (response.statusCode == 1708) {
        return onFailureCallBackWithMessage(
            NetworkResponseErrorType.socket, 'socket');
      }
      return onFailureCallBackWithMessage(
          NetworkResponseErrorType.didNotSucceed, 'unknown');
    } catch (e) {
      return onFailureCallBackWithMessage(
          NetworkResponseErrorType.exception, 'Exception $e');
    }
  }
}
