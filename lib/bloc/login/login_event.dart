import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
   const LoginEvent();

}
class AppStarted extends LoginEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateLoginEvent extends LoginEvent {
  final String username;
  final String password ;

  const UpdateLoginEvent(this.username,this.password);

  @override
  List<Object> get props => [username,password];

  @override
  String toString() => 'StatsUpdated { UserName: $username ,PassWord $password}';


}
class LoggedOut extends LoginEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object?> get props => throw UnimplementedError();
}