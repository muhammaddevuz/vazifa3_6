import 'package:dars_6/models/user.dart';
import 'package:dars_6/services/users_http_services.dart';

class UsersController {
  final usersHttpServices = UsersHttpServices();

  Future<List<User>> getUsers() async {
    List<User> categories = await usersHttpServices.getUsers();

    return categories;
  }
}