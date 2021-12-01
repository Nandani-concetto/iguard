import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iguard/data/repository/login_repository.dart';
import 'package:iguard/result.dart';
import 'package:iguard/ui/login_view.dart';

import 'bloc/login/login_bloc.dart';

void main() => runApp(BlocProvider(
    create: (context) {
      return LoginBloc(repository: LoginRepositoryImpl());
    },
    child: Myapp()));

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // routes: {
      //   '/': (context) =>LoginView(),
      //   '/second' :(context) =>ResultPage(),
      // },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return LoginView();
            },
          );
        } else if (settings.name == ResultPage.routeName) {
          print(settings.arguments);
          final args = settings.arguments as ScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return ResultPage(
                username: args.username,
              );
            },
          );
        }
      },
    );
  }
}
