import 'package:bloc_getusers/bloc/users_state.dart';
import 'package:bloc_getusers/repository/users_rep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_getusers/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository userRep;
  UserCubit(this.userRep) : super(UserEmptyState());

  Future fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> loadedUsers = await userRep.getAllUsers();
      emit(UserLoadedState(loadedUsers));
    } catch (_) {}
  }

  Future clearUsers() async {
    emit(UserEmptyState());
  }
}
