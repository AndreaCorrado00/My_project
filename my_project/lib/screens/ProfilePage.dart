// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:my_project/screens/LoginPage.dart';
import 'package:my_project/screens/StatisticsPage.dart';
import 'package:my_project/screens/TipsPage.dart';
import 'package:my_project/screens/constants.dart';

class ProfilePage extends StatefulWidget {
 const ProfilePage ({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

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

static const routename = 'ProfileScreen';
  @override
  Widget build(BuildContext context) {
    print('${ProfilePageState.routename} built');
    return MaterialApp(
      title: 'Profile ',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Profile'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.settings) )
          ],
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
        body: ListView(
          
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [secondaryColor,primaryColor],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.9],
                ),
              ),
           
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //const CircleAvatar(
                        //backgroundColor: secondarylightColor,
                        //minRadius: 35.0,
                        //child: Icon(
                          //Icons.call,
                          //size: 30.0
                        //),
                      //),
                       CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/images/Laurea-13.jpg'),
                        ),
                      ),
                      //CircleAvatar(
                        //backgroundColor: Colors.red.shade300,
                        //minRadius: 35.0,
                        //child: Icon(
                          //Icons.message,
                          //size: 30.0
                        //),
                      //),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Andrea Corrado',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: secondaryColor,
                      child: const  ListTile(
                        title: Text(
                          '100',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'Trees',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: secondaryColor,
                      child: const ListTile(
                        title: Text(
                          '500',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'LoS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            
            Container(
              
              child: const Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'andrea.corrado00@gmail.com',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Your device',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Amazfit GTS (2020)',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Password',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '******',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Connected services',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Strava,Komoot, ...',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ],
                
              ),
            )
          ],
        ),
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
}}