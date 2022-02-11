import 'package:bloc_getusers/bloc/users_events.dart';
import 'package:bloc_getusers/bloc/users_state.dart';
import 'package:bloc_getusers/repository/users_rep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_getusers/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;
  UserBloc(this.usersRepository) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> _loadedList = await usersRepository.getAllUsers();
        emit(UserLoadedState(_loadedList));
      } catch (_) {
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>((event, emit) => emit(UserEmptyState()));
  }

  // @override
  // Stream<UserState> mapEventToState(UserEvent event) async* {
  //   if (event is UserLoadEvent) {
  //     yield UserLoadingState();
  //     try {
  //       final List<User> _loadedUserList = await usersRepository.getAllUsers();
  //       yield UserLoadedState(_loadedUserList);
  //     } catch (_) {
  //       yield UserErrorState();
  //     }
  //   } else if (event is UserClearEvent) {
  //     yield UserEmptyState();
  //   }
  // }
}
