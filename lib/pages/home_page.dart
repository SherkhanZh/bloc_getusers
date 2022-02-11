import 'package:bloc_getusers/bloc/users_bloc.dart';
import 'package:bloc_getusers/cubit/user_cubit.dart';
import 'package:bloc_getusers/repository/users_rep.dart';
import 'package:flutter/material.dart';
import 'package:bloc_getusers/widgets/action_buttons.dart';
import 'package:bloc_getusers/widgets/users_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final userRep = UsersRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
        create: (context) => UserBloc(userRep),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Users list'),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButton(),
              Expanded(child: UsersList()),
            ],
          ),
        ));
  }
}
