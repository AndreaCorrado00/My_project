// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:my_project/screens/constants.dart';

class StatisticsPage extends StatefulWidget {
 const StatisticsPage ({super.key});

  @override
  StatisticsPageState createState() => StatisticsPageState();
}

class StatisticsPageState extends State<StatisticsPage> {
static const routename = 'StatisticsPage';
  @override
  Widget build(BuildContext context) {
    print('${StatisticsPageState.routename} built');
    return MaterialApp(
      title: 'Statistics ',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Statistics'),
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
}