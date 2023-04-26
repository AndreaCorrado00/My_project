// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:my_project/screens/constants.dart';

class ProfilePage extends StatefulWidget {
 const ProfilePage ({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
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
          
          // TEMP!!
          child:const Column(
            children: [
              SizedBox(height: 100,),
              Text('Once completed \nthe home page \ndrower, here copy\n and paste it',),],),),
        
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
}