import 'package:iguard/bloc/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:iguard/data/model/api_result_model.dart';
import 'package:iguard/data/repository/login_repository.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginRepository repository;

  LoginBloc({required this.repository}):super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is UpdateLoginEvent) {
      yield LoginLoadingState();
      try {
        event.username;
        event.password;
        print(event.username);
        Details articles =(await repository.getLogin(event.username,event.password));
        if(articles.status==200){
          yield LoginLoadedState(user: articles);
        }
        else{
          yield LoginErrorState(message: articles.message!);
          print(articles.message);
        }

      } catch (e, s) {
        print('error $e and $s');
        yield LoginErrorState(message: e.toString());
      }
    }
  }

}