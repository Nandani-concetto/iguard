import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
home: Myapp(),
));
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Widget getRectangleImage(){
    return Image(
      image: AssetImage("assets/images/Rectangle 1.png"),
      fit: BoxFit.cover,
      height: 300,
      width: 414,
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: appBar()
      ),
      body: body(),
    );
  }
  Widget appBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace:
      appbarBOrder(),
      leading: getBackButton() ,
      actions: [
        getSignUp(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child:
        titleSubtitle(),
      ),
    );
  }
  Widget appbarBOrder(){
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.zero ,bottom: Radius.circular(45)),
      child: Stack(
        children: [
          getRectangleImage(),
          getBoxImage(),
        ],),);
  }
  Widget getBoxImage(){
    return Image(image: AssetImage("assets/images/Layer 6.png"),
      fit: BoxFit.cover,
      height: 150,
      //width: 180,
    );
  }
  Widget getBackButton(){
    return Padding(
      padding: const EdgeInsets.only(top: 27.0,left: 32),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios,
            color: Colors.white
        ),
        onPressed: () {},
        //onPressed: ()
      ),
    );
  }
  Widget getSignUp(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:32.84,right: 32),
        child: Text("SIGN UP",
          style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
  Widget titleSubtitle(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom:63.58,left:33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          appbarTitle(),
          appbarSubTitle(),
        ],
      ),
    );
  }
  Widget appbarTitle(){
    return Text("Let's Login",
      style: TextStyle(
          fontFamily: "Nunito",
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 36.0
      ),
    );
  }
  Widget appbarSubTitle(){
    return RichText(
      text: TextSpan(
          text: "Do you have an Login?",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontWeight: FontWeight.normal,
              fontSize: 15.0
          ),
          children: <TextSpan>[
            TextSpan(
                text: " Login",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0
                )
            )
          ]
      ),
    );
  }
  Widget body(){
    return Stack(

      children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                boxOfEmail(),
                Column(
                  children: [
                    boxOfPassword(),
                  ],
                ),

                forgotAccountLabel(),
                Stack(
                    children: [
                      loginButton(),
                      backgroundImage(),
                    ]

                ),
              ],

            ),
          ),
        ),

      ],
    );
  }
  Widget boxOfEmail(){
    return  Padding(
      padding: EdgeInsets.only(top:10,left: 32,right: 32),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                //spreadRadius: 10,
                blurRadius: 10,
              )
            ]
        ),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
              ),
              enabledBorder:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ) ,
              labelText : "Email/Licence Number",
              labelStyle: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.normal
              )
          ),
        ),
      ),
    );
  }
  Widget boxOfPassword(){
    return Padding(
      padding: EdgeInsets.only(top: 30,left: 32, right: 32),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 10,
              ),
            ]
        ),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
              ),
              enabledBorder:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),

              ) ,
              // suffix: Image(
              //   image: AssetImage("assets/images/eye-alt.png"),
              //   fit: BoxFit.cover,
              // ),
              labelText: 'Password',
              labelStyle:TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.normal
              ) ,
              suffixIcon: IconButton(
                icon: Image.asset(
                  "assets/images/eye-alt.png",
                  color: Colors.black,
                ),
                onPressed: () {},
              )
          ),

        ),
      ),


    );
  }
  Widget forgotAccountLabel(){
    return  FlatButton(
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
  Widget loginButton(){
    return Padding(
      padding: const EdgeInsets.only(left:32,right:32,top: 50),
      child: Container(height: 56,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),

        child: FlatButton(
          onPressed: () {},
          child: Text('LOGIN',
            style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 17),
          ),
        ),

      ),
    );
  }
  Widget backgroundImage(){
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        //color: Colors.black,
        margin: const EdgeInsets.only(left:33.6,top:40.95),
        child: (Image.asset("assets/images/Layer 6_1.png",
          fit: BoxFit.cover,
          color: Colors.black,
          height: 416.51,
          width: 550.68,
        )),
      ),
    );
  }
}

