import 'dart:convert';
import 'package:flutter_random_user_api/userModel.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  Future<Welcome> getUser(String elemanSayisi) async {
    final response = await http.Client().get('https://randomuser.me/api/?results=$elemanSayisi');
    await Future.delayed(Duration(seconds: 1));

    if (response.statusCode != 200) {
      throw Exception();
    }
    print(response.body.toString());
    return parsedJson(response.body.toString());
  }
  Welcome parsedJson(final response) {
    final jsonDecode = json.decode(response);
    return Welcome.fromMap(jsonDecode);
  }
}
