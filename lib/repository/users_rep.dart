import 'package:bloc_getusers/models/user_model.dart';
import 'package:bloc_getusers/network/users_provider.dart';

class UsersRepository {
  UsersProvider _usersProvider = UsersProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
