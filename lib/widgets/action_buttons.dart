import 'package:bloc_getusers/bloc/users_bloc.dart';
import 'package:bloc_getusers/bloc/users_events.dart';
import 'package:bloc_getusers/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    //final UserCubit userCubit = context.read<UserCubit>();
    final UserBloc userBloc = context.read<UserBloc>(); //
    // bloc 8.0
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            //userCubit.fetchUsers();
            userBloc.add(UserLoadEvent());
          },
          child: Text('Load'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
        ),
        SizedBox(
          width: 8.0,
        ),
        ElevatedButton(
          onPressed: () {
            //userCubit.clearUsers();
            userBloc.add(UserClearEvent());
          },
          child: Text('Clear'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        )
      ],
    );
  }
}
