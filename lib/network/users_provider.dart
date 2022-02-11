import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bloc_getusers/models/user_model.dart';

class UsersProvider {
  Future<List<User>> getUser() async {
    var url = Uri.parse('http://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userJson = jsonDecode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }
}
