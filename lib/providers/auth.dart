import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/register.dart';
import '../models/login.dart';
import '../models/register_response.dart';
import '../models/user_response.dart';
import '../models/login_response.dart';

class AuthProvider extends ChangeNotifier {
  final String domain =
      'utadeo-apps-load-balancing-2034895534.us-east-1.elb.amazonaws.com';

  String token = '';

  login(Login data) async {
    bool logedIn = false;
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Uri url = Uri.http(domain, '/v1/user/login');
    var response =
        await http.post(url, body: jsonEncode(data.toJson()), headers: headers);
    LoginResponse responseData =
        LoginResponse.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      logedIn = true;
      token = responseData.data!.token!;
    }

    notifyListeners();

    return logedIn;
  }

  Future<bool> signUp(Register register) async {
    bool isCreated = false;
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Uri url = Uri.http(domain, '/v1/user/sign-up');
    var response = await http.post(url,
        body: jsonEncode(register.toJson()), headers: headers);
    RegisterResponse responseData =
        RegisterResponse.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      isCreated = true;
    }

    notifyListeners();

    return isCreated;
  }

  Future<UserResponse?> getUserInfo() async {
    UserResponse? responseData = null;
    Map<String, String> headers = {"Authorization": 'Bearer ${token}'};

    Uri url = Uri.http(domain, '/v1/user');
    var response = await http.get(url, headers: headers);
    
    print(response.statusCode);
    if (response.statusCode == 200) {
      responseData = UserResponse.fromJson(json.decode(response.body));
    }

    notifyListeners();

    return responseData;
  }
}
