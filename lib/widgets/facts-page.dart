import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_guidelines/common/functions/filter-functions.dart';
import 'package:flutter_guidelines/common/utils/constants.dart';
import 'package:flutter_guidelines/models/facts.dart';
import 'package:flutter_guidelines/models/facts.dart';
import 'package:flutter_guidelines/services/facts-service/facts-calling.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _resultText = "";
  String _buttonText = "Click";
  late ApiService apiservice;
  Future<void> getfactsDetails() async {
    return await Future.value(2);
  }

  @override
  void initState() {
    apiservice = ApiService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _resultText = "";
                  _buttonText = "fetching";
                });
                List<facts> result =
                    await apiservice.getApiCallingService<facts>(
                  callback: CommonFilter.filterfactsList,
                );
                setState(() {
                  _buttonText = "Click";
                  _resultText = result.isNotEmpty ? 'Done' : "fail";
                });
              },
              child: Text(_buttonText),
            ),
            Text(
              _resultText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
