import 'package:flutter_guidelines/common/utils/constants.dart';
import 'package:flutter_guidelines/services/netowrk-service.dart';
import 'package:flutter_guidelines/services/network_typedef.dart';

abstract class ApiServiceInterface {
  Future<List<T>> getApiCallingService<T>({
    required NetworkCallBack<T> callback,
  });
}

class ApiService extends ApiServiceInterface {
  Future<List<T>> getApiCallingService<T>({
    required NetworkCallBack<T> callback,
  }) async {
    var result = await NetworkService.sendRequest(
      requestType: RequestType.get,
      url: StaticValues.apiUrl,
    );
    return callback.call(result!.body);
  }
}
