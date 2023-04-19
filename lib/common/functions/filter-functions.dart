import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_guidelines/models/facts.dart';

class CommonFilter {
  static List<facts> filterfactsList(dynamic p1) {
    var jsonData = jsonDecode(p1);
    List<facts> res = (jsonData as List).map((e) => facts.fromJson(e)).toList();
    return res;
  }
}
