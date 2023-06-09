// Mocks generated by Mockito 5.0.15 from annotations
// in flutter_guidelines/test/facts/mock-repo/facts_mockrepo_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_guidelines/services/network_typedef.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

import 'facts_mockrepo_test.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ApiServiceTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiServiceTest extends _i1.Mock implements _i2.ApiServiceTest {
  MockApiServiceTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
  @override
  _i3.Future<List<T>> getApiCallingService<T>(
          {_i4.NetworkCallBack<T>? callback}) =>
      (super.noSuchMethod(
          Invocation.method(#getApiCallingService, [], {#callback: callback}),
          returnValue: Future<List<T>>.value(<T>[])) as _i3.Future<List<T>>);
}
