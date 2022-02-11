import 'package:bloc_getusers/bloc/users_bloc.dart';
import 'package:bloc_getusers/bloc/users_state.dart';
import 'package:bloc_getusers/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text('List is empty'),
        );
      }
      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        return ListView.builder(
            itemCount: state.loadedUsers.length,
            itemBuilder: (context, index) => Container(
                  color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                  child: ListTile(
                    leading: Text(
                      'ID: ${state.loadedUsers[index].id}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Column(
                      children: [
                        Text(
                          'Name: ${state.loadedUsers[index].name}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Email: ${state.loadedUsers[index].email}',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Phone: ${state.loadedUsers[index].phone}',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      } else if (state is UserErrorState) {
        return Container(
          child: Text('Error loading'),
        );
      }
      return CircularProgressIndicator();
    });
  }
}
