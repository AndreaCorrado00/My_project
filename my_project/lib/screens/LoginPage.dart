import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:flutter_login/flutter_login.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routename = 'LoginPage';
  Future<String> _loginUser(LoginData data) async {
    final dataDB=await SharedPreferences.getInstance();
    if(dataDB.getString('name')  == 'andrea@gmail.com' && dataDB.getString('password') == '0000'){
      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    // Problems: i have to control the flow of the database. At the moment, the login doesn't uses the saved name, moreover, an other used different from andre@gmai.com will provide a logic erro
     final dataDB=await SharedPreferences.getInstance();
     await dataDB.setString('name', data.name!);
     await dataDB.setString('password', data.password!);
     SignupData.fromSignupForm(name: dataDB.getString('name'), password: dataDB.getString('password'));
     return '';
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
      onSubmitAnimationCompleted: () async{Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePageState ()));},
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