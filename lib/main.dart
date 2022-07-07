import 'package:bloc_101/features/users/domain/entities/user.dart';
import 'package:bloc_101/features/users/presentation/bloc/users_bloc.dart';
import 'package:bloc_101/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injection.dart';
import 'features/users/presentation/pages/bottom_sheet_page.dart';

void main() {
  configureInjection();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<UsersBloc>()..add(GetUsersEvent()),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoaded) {
            return ListView.separated(
              itemCount: state.users.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                UserEntity user = state.users[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BottomSheetPage(
                          id: user.id!,
                        ),
                      ),
                    );
                    // showBottomSheet(
                    //     context: context,
                    //     builder: (context) => BottomSheetPage(id: user.id!));
                  },
                  child: ListTile(
                    title: Text(user.firstName!),
                    subtitle: Text(user.lastName!),
                  ),
                );
              },
            );
          }

          if (state is UsersErrored) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is UsersRefreshing) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UsersBloc>().add(UsersRefreshEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
