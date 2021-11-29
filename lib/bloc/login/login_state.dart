import 'package:flutter/material.dart';
import 'package:iguard/data/model/api_result_model.dart';

abstract class LoginState extends Equatable {}

class Equatable {
}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginLoadedState extends LoginState {

  Details user;

  LoginLoadedState({required this.user});

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class LoginErrorState extends LoginState {

  String message;

  LoginErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}