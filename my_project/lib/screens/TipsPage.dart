// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:my_project/screens/LoginPage.dart';
import 'package:my_project/screens/ProfilePage.dart';
import 'package:my_project/screens/StatisticsPage.dart';
import 'package:my_project/screens/constants.dart';

class TipsPage extends StatefulWidget {
 const TipsPage ({super.key});

  @override
  TipsPageState createState() => TipsPageState();
}

class TipsPageState extends State<TipsPage> {

  // Constants of building
  static final _TextButtonStyle_Drawer=TextButton.styleFrom(
                foregroundColor: secondarylightColor,
                shadowColor: secondaryColor,
                fixedSize: const Size(250, 50),
                alignment: const Alignment(-0.95, 0),
                textStyle: const TextStyle(
                fontFamily: myfontFamily,
                fontSize: 20.0,
              ));
  static final _TextButtonStyle_HomePage=TextStyle(
                        fontFamily: myfontFamily,
                        fontSize: 25.0,
                        color:secondaryColor,
                      );

    static final _TextButtonStyle_Alert=TextButton.styleFrom(
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
    return MaterialApp(
      title: 'Tips ',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Advice and Tips'),
          //automaticallyImplyLeading: true,
          
        ),
drawer: Drawer(
        backgroundColor: secondaryColor,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              children: [
                TextButton(
                style: _TextButtonStyle_Drawer,
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage()));},
                
              child: const Text('Profile'),
              ),
              Icon(
                  IconData(0xe491, fontFamily: 'MaterialIcons'),
                  color: secondarylightColor,
                  size: 24.0,
                  ),
              ],
            
            ),
            SizedBox(width: 300,height: 1,),
            Row(
              children: [
                TextButton(
                style: _TextButtonStyle_Drawer,
              onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => StatisticsPage()));},
              child: const Text('Statistics'),),
              Icon(
                  IconData(0xebef, fontFamily: 'MaterialIcons'),
                  color: secondarylightColor,
                  size: 24.0,
                  ),
              ],
            
            ),
            SizedBox(width: 300,height: 1,),
            Row(
              children: [
                TextButton(
                style: _TextButtonStyle_Drawer,
              onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => TipsPage()));},
              child: const Text('Advice and Tips'),),
              Icon(
                  Icons.tips_and_updates,
                  color: secondarylightColor,
                  size: 24.0,
                  ),
              ],
            
            ),
            SizedBox(width: 300,height: 1,),
            Row(
              children: [
                TextButton(
                style: _TextButtonStyle_Drawer,
              onPressed: (){_OnLogoutTapConfirm(context);},
              child: const Text('Logout'),),
              Icon(
                  IconData(0xe3b3, fontFamily: 'MaterialIcons'),
                  color: secondarylightColor,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                  ),
              ],
            
            ),
            SizedBox(width: 300,height: 1,),
          ],
      ),),
      backgroundColor: primaryLightColor,
        
        body: ListView(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.home),
          onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => HomePageState()));},
          backgroundColor: secondaryColor,
          elevation: 0.0,
          splashColor: primaryLightColor,
          ),
    floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
      ),
    );
  }

void _OnLogoutTapConfirm(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () { Navigator.push(context,MaterialPageRoute(builder: (context) => HomePageState()));},
    style: _TextButtonStyle_Alert ,

  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage ()));},
    style: _TextButtonStyle_Alert ,
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