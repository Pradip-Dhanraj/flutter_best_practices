import 'dart:convert';

import 'package:flutter_guidelines/common/functions/filter-functions.dart';
import 'package:flutter_guidelines/common/utils/constants.dart';
import 'package:flutter_guidelines/services/facts-service/facts-calling.dart';
import 'package:flutter_guidelines/services/netowrk-service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'facts_test.mocks.dart';

/// command to create mock class - flutter pub run build_runner build

@GenerateMocks([http.Client])
void main() {
  var apiservice = ApiService();
  var setup = () {};

  setUp(setup);

  tearDown(() {});

  test('facts api working', () async {
    var result = await apiservice.getApiCallingService(
      callback: CommonFilter.filterfactsList,
    );
    expect(result.isNotEmpty, true);
  }, skip: true);

  group('testing mock data', () {
    test('facts api working', () async {
      var result = await apiservice.getApiCallingService(
        callback: CommonFilter.filterfactsList,
      );
      expect(result.isNotEmpty, true);
    }, skip: false);

    test(
      'facts api working',
      () async {
        var client = MockClient();
        NetworkService.mockClientSetter = client;
        when(client.get(Uri.parse(StaticValues.apiUrl),
                headers: NetworkService.getHeaders))
            .thenAnswer((_) async => http.Response(
                jsonEncode([
                  // {
                  //   "status": {
                  //     "verified": true,
                  //     "feedback": "",
                  //     "sentCount": 1
                  //   },
                  //   "_id": "5887e1d85c873e0011036889",
                  //   "user": "5a9ac18c7478810ea6c06381",
                  //   "text":
                  //       "Cats make about 100 different sounds. Dogs make only about 10.",
                  //   "__v": 0,
                  //   "source": "user",
                  //   "updatedAt": "2020-09-03T16:39:39.578Z",
                  //   "type": "cat",
                  //   "createdAt": "2018-01-15T21:20:00.003Z",
                  //   "deleted": false,
                  //   "used": true
                  // }
                ]),
                200));
        var result = await apiservice.getApiCallingService(
          callback: CommonFilter.filterfactsList,
        );
        print('lenght print ${result.length == 1}');
        expect(result.isEmpty, true);
        NetworkService.mockClientSetter = null;
      },
      skip: false,
    );
  });
}
