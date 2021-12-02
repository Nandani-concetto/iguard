import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iguard/bloc/login/login_bloc.dart';
import 'package:iguard/bloc/login/login_event.dart';
import 'package:iguard/bloc/login/login_state.dart';
import 'package:iguard/result.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();
  var emailController = TextEditingController();
  String password = '';
  String email = '';
  bool isPasswordVisible = false;
  bool isError = false;
  bool isWriting = false;
  bool isLoginPressed = false;
  int counter = 0;
  String myErrorString = "";
  late TextSelection currentPosition;
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();
  var selected ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(300.0), child: buildAppBar()),
      body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: buildAppBarBorder(),
      leading: getBackButton(),
      actions: [
        getSignUp(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: buildTitleSubTitle(),
      ),
    );
  }

  Widget getRectangleImage() {
    return Image(
      image: AssetImage("assets/images/Rectangle 1.png"),
      fit: BoxFit.cover,
      height: 300,
      width: 414,
    );
  }

  Widget buildAppBarBorder() {
    return ClipRRect(
      borderRadius:
          BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(45)),
      child: Stack(
        children: [
          getRectangleImage(),
          getBoxImage(),
        ],
      ),
    );
  }

  Widget getBoxImage() {
    return Image(
      image: AssetImage("assets/images/Layer 6.png"),
      fit: BoxFit.cover,
      height: 150,
      //width: 180,
    );
  }

  Widget getBackButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 27.0, left: 32),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {},
        //onPressed: ()
      ),
    );
  }

  Widget getSignUp() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.84, right: 32),
        child: Text(
          "SIGN UP",
          style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Widget buildTitleSubTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 63.58, left: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBarTitle(),
          buildAppBarSubTitle(),
        ],
      ),
    );
  }

  Widget buildAppBarTitle() {
    return Text(
      "Let's Login",
      style: TextStyle(
          fontFamily: "Nunito",
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 36.0),
    );
  }

  Widget buildAppBarSubTitle() {
    return RichText(
      text: TextSpan(
          text: "Do you have an Login?",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontWeight: FontWeight.normal,
              fontSize: 15.0),
          children: <TextSpan>[
            TextSpan(
                text: " Login",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0))
          ]),
    );
  }

  Widget buildBody()  {
    return Form(
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildBoxOfEmail(),
                  Column(
                    children: [
                      buildBoxOfPassword(),
                    ],
                  ),
                  buildForgotAccountLabel(),
                  Stack(children: [
                    grtBackgroundImage(),
                    getLoginButton(),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
      onChanged: () {
        counter++;
        if (counter == 2) {
          counter = 0;
          isLoginPressed = false;
        }
        if (isLoginPressed) {
        } else {
          isWriting = true;
          isLoginPressed = false;
          myErrorString = "";
        }
      },
    );
  }

  Widget buildBoxOfEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 32, right: 32),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            //spreadRadius: 10,
            blurRadius: 10,
          )
        ]),
        child: TextFormField(
          key: emailKey,
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'name@example.com',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white70),
            ),
            labelText: "Email/Licence Number",
            labelStyle:
                TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.normal),
            suffixIcon:  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => emailController.clear(),
                  ),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (isLoginPressed) {
              isError = true;
              if (value!.isEmpty) {
                myErrorString = 'Email is Empty';
                return myErrorString;
              } else if (!RegExp(
                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                  .hasMatch(value)) {
                myErrorString = 'Please Enter valid Email';
                return myErrorString;
              }
              isError = false;
              myErrorString = "";
            } else {
              myErrorString = "";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget buildBoxOfPassword() {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 32, right: 32),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
          ),
        ]),
        child: Column(
          children: <Widget>[
            TextFormField(
              key: passwordKey,
              controller: controller,
              onChanged: (value) {
                setState(() {
                  this.password = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  this.password = value!;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontFamily: "Nunito", fontWeight: FontWeight.normal),
                  suffixIcon: IconButton(
                    icon: isPasswordVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )),
              obscureText: isPasswordVisible,
              validator: (value) {
                myErrorString = "";
                if (isLoginPressed) {
                  isError = true;
                  if (value!.isEmpty) {
                    myErrorString = 'Please Enter Password';
                    return myErrorString;
                  } else if (value.length < 6) {
                    myErrorString =
                        'Password must be at least 6 character long';
                    //validateMe();
                    return myErrorString;
                  }
                  isError = false;
                  myErrorString = "";
                } else {
                  myErrorString = "";
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForgotAccountLabel() {
    return FlatButton(
      color: Colors.white,
      onPressed: () {},
      child: Text(
        'Forgotten account?',
        style: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget getLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 50),
      child: Container(
        height: 56,
        width: 350,
        child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
          if (state is LoginErrorState) {
            displayDialog(context,state.message);

          }
          if (state is LoginLoadedState) {
            Navigator.pushNamed(context, '/extractArguments',
                arguments: ScreenArguments(
                  state.user.result!.username!,
                ));
          }
        }, builder: (context, state) {
          if (state is LoginLoadingState) {
            return Center(child: const CircularProgressIndicator());
          }

          return ElevatedButton(
            onPressed: () {
              counter = 1;
              isWriting = false;
              isLoginPressed = true;
              final isValid = emailKey.currentState!.validate();
              if (isValid) {
                emailKey.currentState!.save();
                final success=passwordKey.currentState!.validate();
                if(success){
                  passwordKey.currentState!.save();
                  BlocProvider.of<LoginBloc>(context)
                      .add(UpdateLoginEvent(emailController.text, password));
                  print("Email : ${emailController.text}");
                  print("PassWord : ${password}");
                }

              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.black),
            child: Text(
              'LOGIN',
              style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 17),
            ),
          );
        }),
      ),
    );
  }

  displayDialog(BuildContext context,String message) async {
    await showDialog(
        context: context,
        builder:(BuildContext context){
          return SimpleDialog(
            title: Text('Welcome'),
            children:[
              SimpleDialogOption(
                child:  Text(message,
                  style: TextStyle(
                    fontSize:15
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:Padding(
                  padding: const EdgeInsets.only(left:210),
                  child: Text("OK"),
                ),
              ),
            ],
           // elevation: 10,
          );
        }
    );
  }
  Widget grtBackgroundImage() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        //color: Colors.black,
        margin: const EdgeInsets.only(left: 33.6, top: 40.95),
        child: (Image.asset(
          "assets/images/Layer 6_1.png",
          fit: BoxFit.cover,
          color: Colors.black,
          height: 416.51,
          width: 550.68,
        )),
      ),
    );
  }
}
