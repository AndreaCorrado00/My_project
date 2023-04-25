import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:flutter_login/flutter_login.dart';
import 'constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routename = 'LoginPage';

  Future<String> _loginUser(LoginData data) async {
    if(data.name == 'andrea@gmail.com' && data.password == '0000'){
      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  } // _signUpUser

  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    
    return FlutterLogin(
      title: 'Project',
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePageState ()));
      },
      theme: LoginTheme(
        pageColorLight: primaryColor,
        primaryColor: secondaryColor,
        accentColor: secondarylightColor,
        errorColor: Colors.deepOrange,
        
        // ignore: prefer_const_constructors
        titleStyle: TextStyle(
          color: primaryLightColor,
          fontFamily: myfontFamily,
          letterSpacing: 4,),
        ),
        
        
    );
  } // build
} // LoginScreen