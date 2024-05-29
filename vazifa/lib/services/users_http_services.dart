import 'dart:convert';

import 'package:dars_6/models/user.dart';
import 'package:http/http.dart' as http;

class UsersHttpServices {
  Future<List<User>> getUsers() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<User> loadedUsers = [];

    if (data != null) {
      data.forEach(
        (value) {
          loadedUsers.add(User.fromJson(value));
        },
      );
    }

    return loadedUsers;
  }
}
