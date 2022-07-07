import 'package:bloc_101/features/users/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/injection.dart';

class BottomSheetPage extends StatelessWidget {
  final int id;
  const BottomSheetPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>()..add(GetUserEvent(userid: id)),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
          } else if (state is UserLoaded) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(child: Image.network(state.user.avatar!)),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Text('${state.user.firstName} ${state.user.lastName}'),
                    Text('${state.user.email}'),
                  ],
                ))
              ],
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
