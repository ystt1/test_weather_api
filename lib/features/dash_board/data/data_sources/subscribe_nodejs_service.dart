import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/core/constants/url.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/verify_payload.dart';
import 'package:http/http.dart' as http;

abstract class SubscribeNodejsService {
  Future<Either> sendCode(String email);

  Future<Either> subscribe(VerifyPayload payload);
}

class SubscribeNodejsServiceImp extends SubscribeNodejsService {
  @override
  Future<Either> sendCode(String email) async {
    final response = await http.post(
      Uri.parse("$emailUrl/send-otp"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    var utf8Body = utf8.decode(response.bodyBytes);
    var jsonData = jsonDecode(utf8Body);
    if (response.statusCode == 200) {
      return Right("success");
    } else {
      return Left(jsonData['message']);
    }
  }

  @override
  Future<Either> subscribe(VerifyPayload payload) async {
    try {
      final response = await http.post(
        Uri.parse("$emailUrl/verify-otp"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload.toMap()),
      );

      var utf8Body = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(utf8Body);
      if (response.statusCode == 200) {
        return Right("success");
      } else {
        return Left(jsonData['error']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
