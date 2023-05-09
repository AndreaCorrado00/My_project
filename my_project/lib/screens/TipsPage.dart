// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:my_project/screens/LoginPage.dart';
import 'package:my_project/screens/ProfilePage.dart';
import 'package:my_project/screens/StatisticsPage.dart';
import 'package:my_project/screens/constants.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/utils/impact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  TipsPageState createState() => TipsPageState();
}

class TipsPageState extends State<TipsPage> {
  // Constants of building
  static final _TextButtonStyle_Drawer = TextButton.styleFrom(
      foregroundColor: secondarylightColor,
      shadowColor: secondaryColor,
      fixedSize: const Size(250, 50),
      alignment: const Alignment(-0.95, 0),
      textStyle: const TextStyle(
        fontFamily: myfontFamily,
        fontSize: 20.0,
      ));
  static final _TextButtonStyle_HomePage = TextStyle(
    fontFamily: myfontFamily,
    fontSize: 25.0,
    color: secondaryColor,
  );

  static final _TextButtonStyle_Alert = TextButton.styleFrom(
      foregroundColor: secondaryColor,
      shadowColor: secondarylightColor,
      textStyle: const TextStyle(
        fontFamily: myfontFamily,
        fontSize: 15.0,
      ));

  static const routename = 'StatisticsPage';
  @override
  Widget build(BuildContext context) {
    print('${TipsPageState.routename} built');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Advice and Tips'),
        //automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        backgroundColor: secondaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                TextButton(
                  style: _TextButtonStyle_Drawer,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: const Text('Profile'),
                ),
                Icon(
                  IconData(0xe491, fontFamily: 'MaterialIcons'),
                  color: secondarylightColor,
                  size: 24.0,
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 1,
            ),
            Row(
              children: [
                TextButton(
                  style: _TextButtonStyle_Drawer,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatisticsPage()));
                  },
                  child: const Text('Statistics'),
                ),
                Icon(
                  IconData(0xebef, fontFamily: 'MaterialIcons'),
                  color: secondarylightColor,
                  size: 24.0,
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 1,
            ),
            Row(
              children: [
                TextButton(
                  style: _TextButtonStyle_Drawer,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TipsPage()));
                  },
                  child: const Text('Advice and Tips'),
                ),
                Icon(
                  Icons.tips_and_updates,
                  color: secondarylightColor,
                  size: 24.0,
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 1,
            ),
            Row(
              children: [
                TextButton(
                  style: _TextButtonStyle_Drawer,
                  onPressed: () {
                    _OnLogoutTapConfirm(context);
                  },
                  child: const Text('Logout'),
                ),
                Icon(
                  IconData(0xe3b3, fontFamily: 'MaterialIcons'),
                  color: secondarylightColor,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 1,
            ),
          ],
        ),
      ),
      

      backgroundColor: primaryLightColor,
      body:
      Center(
        
        child: Column(
        children:[ TextButton (
          
          onPressed: () async{
            final resoult = await _pingImpact();
            if (resoult == true){print('Request Succesfull'); }
            
          },
          child: Text('ping Impact'), style: _TextButtonStyle_Alert),
          TextButton (
          
          onPressed: () async{
            final resoult = await _getAndStoreTokens();
            if (resoult == 200){print('Stored');}
            else {print('No way ');} 
          },
          child: Text('get and store tokens'), style: _TextButtonStyle_Alert),

          TextButton (
          
          onPressed: () async{
            final resoult = await _getAndStoreTokens();
            if (resoult == 200){print('refreshed');}
            else {print('No way ');} 
          },
          child: Text('refresh tokens'), style: _TextButtonStyle_Alert),],),),
      floatingActionButton: FloatingActionButton(
        
        child: const Icon(Icons.home),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePageState()));
        },
        backgroundColor: secondaryColor,
        elevation: 0.0,
        splashColor: primaryLightColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  //Handling http request
  Future<bool> _pingImpact() async{
    
    final url=Impact.baseUrl + Impact.pingEndpoint;

    // finally the call
    final response =await http.get(Uri.parse(url)); // is an async function
    
    return response.statusCode==200;


  }

  Future<int> _getAndStoreTokens() async {

    //Create the request
    final url = Impact.baseUrl + Impact.tokenEndpoint;
    final body = {'username': Impact.username, 'password': Impact.password};

    //Get the response
    print('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If response is OK, decode it and store the tokens. Otherwise do nothing.
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      await sp.setString('access', decodedResponse['access']);
      await sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Just return the status code
    return response.statusCode;
  } //_getAndStoreTokens

  //This method allows to refrsh the stored JWT in SharedPreferences
  Future<int> _refreshTokens() async {

    //Create the request 
    final url = Impact.baseUrl + Impact.refreshEndpoint;
    final sp = await SharedPreferences.getInstance();
    final refresh = sp.getString('refresh');
    final body = {'refresh': refresh};

    //Get the response
    print('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If the response is OK, set the tokens in SharedPreferences to the new values
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      await sp.setString('access', decodedResponse['access']);
      await sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Just return the status code
    return response.statusCode;
    
  } //_refreshTokens


  void _OnLogoutTapConfirm(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePageState()));
      },
      style: _TextButtonStyle_Alert,
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      style: _TextButtonStyle_Alert,
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
      backgroundColor: primaryLightColor,
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
