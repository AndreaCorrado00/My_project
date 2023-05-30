// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:my_project/screens/StatisticsPage.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/utils/impact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_project/utils/constants.dart';
import 'package:my_project/Models/Steps.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  TipsPageState createState() => TipsPageState();
}

class TipsPageState extends State<TipsPage> {
 //-------------- Index used trought the code to build widgets
  int _selectedIndex = 1;
  static const routename = 'TipsPage';
  @override
  Widget build(BuildContext context) {
    print('${TipsPageState.routename} built');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Advice and Tips'),
        //automaticallyImplyLeading: true,
      ),

      backgroundColor: Constants.primaryLightColor,
      body:
      Center(
        
        child: Column(
        children:[ TextButton (
          onPressed: () async{
            final resoult = await _pingImpact();
            if (resoult == true){print('Request Succesfull'); }
          },
          child: Text('ping Impact'), style: Constants.TextButtonStyle_Alert),

          TextButton (
          onPressed: () async{
            final resoult = await _getAndStoreTokens();
            if (resoult == 200){print('Stored');}
            else {print('No way ');} 
          },
          child: Text('get and store tokens'), style: Constants.TextButtonStyle_Alert),

          TextButton (
          
          onPressed: () async{
            final resoult = await _getAndStoreTokens();
            if (resoult == 200){print('refreshed');}
            else {print('No way ');} 
          },
          child: Text('refresh tokens'), style: Constants.TextButtonStyle_Alert),
          
          ElevatedButton(
                onPressed: () async {
                  final result = await _getStep();
                  print(result);
                  final message =
                      result == null ? 'Request failed' : 'Request successful';
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text('Get the data')),

          ],
          ),),



          bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates),
            label: 'Advice and Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Statistics',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Constants.primaryColor,
        selectedItemColor: Constants.secondarylightColor,
        selectedFontSize: 14.0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomePageState()));
            //break;
            case 1:
            if (index != 1) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const TipsPage()));
              } else {
                print('still in the Statistics page ');
              }
            

    

            //break;
            case 2:
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const StatisticsPage()));
              
              // Probably in this case you have to put an if: if the index is not pointing the home and you are in the case of the home, return to home
              break;
          }

          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),

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
    
  }
  
  Future _getStep()async{
    //_getAndStoreTokens();
    final sp=await SharedPreferences.getInstance();
    var access=sp.getString('access');
    if (access == null){
      return false;
    }
    else{
      if(JwtDecoder.isExpired(access!)){
        await _refreshTokens();
        access = sp.getString('access');
      }
      final day='2023-05-15';
      final url=Impact.baseUrl+Impact.stepEndpoint + 'patients/Jpefaq6m58'+'/day/$day/';

      final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'}; //fixed costruction!

      final response = await http.get(Uri.parse(url), headers: headers);

      // Now we have made the request ad, probably, the response. But how to get data?

      //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      List result = [];
      for (var i = 0; i < decodedResponse['data']['data'].length; i++) {
        result.add(Steps.fromJson(decodedResponse['data']['date'], decodedResponse['data']['data'][i]));
      }//for
    } //if
    else{
      void result = null;
    }//else
    }

  }//getStep
}
