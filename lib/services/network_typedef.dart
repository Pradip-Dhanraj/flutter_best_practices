import 'package:flutter_guidelines/services/network-enum.dart';

typedef NetworkCallBack<R> = List<R> Function(dynamic);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(
    NetworkResponseErrorType, String?);
