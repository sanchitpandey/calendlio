import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class ApiLogic {
  Future<http.Response> register(
    String fname,
    String lname,
    String address,
    String phone,
    String email,
  ) async {
    return await http.post(
      URL + "auth/register",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': fname,
        'last_name': lname,
        'address': address,
        'phone_number': "+91" + phone,
        'email': email,
      }),
    );
  }

  Future<http.Response> sendOTP(String phone) async {
    return await http.post(
      URL + "verification/phone",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'phone_number': "+91" + phone}),
    );
  }

  Future<http.Response> login(String phone, String otp) async {
    return await http.post(
      URL + "auth/login",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'otp': otp, 'phone_number': "+91" + phone}),
    );
  }

  // Token Logic

  setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', token);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }
}
