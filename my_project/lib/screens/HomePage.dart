// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_project/screens/AddActivity.dart';
import 'package:my_project/screens/CurrentTarget.dart';
import 'package:my_project/screens/LoginPage.dart';
import 'package:my_project/screens/ProfilePage.dart';
import 'package:my_project/screens/StatisticsPage.dart';
import 'package:my_project/screens/TipsPage.dart';
import 'package:my_project/screens/constants.dart';
import 'package:intl/intl.dart';
import 'package:my_project/Database/Advice_Database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_digit/animated_digit.dart';



// Using DateTime to read the date and handling the daily advice
  DateTime _now = DateTime.now();
  String formattedDate = DateFormat.d().format(_now);
  int today=int.parse(formattedDate);
  int today_index=today%17;
  final Uri _url = Uri.parse(Advices[today_index]['url']);


//-------------- UI of the page
class HomePageState extends StatefulWidget {
  const HomePageState ({super.key});

  @override
  State<HomePageState > createState() => HomePage();
}





class HomePage extends State<HomePageState>{

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

  
  static const routename = 'Homepage';


//-------------- Index used trought the code to build widgets
int _selectedIndex = 0;

  
 



  @override
  Widget build(BuildContext context) {
  
  // Daily advice handler 
  


    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(HomePage.routename),
        
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
      
      body: Column(
          
          children: [
            SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
              height: 250,
              width: 350,
              color: thirdColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  SizedBox(height: 10,),
                  Text('Curiosity of the day',
                  style: TextStyle(color: secondaryColor, fontSize: 20,fontFamily: myfontFamily,fontWeight: FontWeight.bold ),),
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment(-0.9,1) ,
                    child: Text('Do you know?',
                          style: TextStyle(color: secondaryColor,fontFamily: myfontFamily, fontSize: 15,fontWeight: FontWeight.bold),),),
                  SizedBox(height: 10,),
                  
                  Container(
                    height: 100,
                    width: 300,
                    
                    child: Text(Advices[today_index]['adv_text'],
                      style: TextStyle(fontSize:15 ), textAlign: TextAlign.justify,)
                  ),
                  SizedBox(height: 10,),
                  Align(
                    
                    alignment: Alignment(-0.9,5) ,
                  child: TextButton(
                    onPressed: (){_launchUrl(); },
                    child: Text('Learn more', style: 
                                TextStyle(color: Color.fromARGB(255, 0, 174, 255),fontFamily: myfontFamily, fontSize: 15,fontWeight: FontWeight.bold),),),)

                ],
              ),),
            ),
            SizedBox(height: 50),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                SizedBox(
                  height: 200,width: 200,
                  child: 
                  Column(
                    children: [
                      Text('LoS',
                      style: _TextButtonStyle_HomePage,
                      ),
                      Icon(
                        IconData(0xe07e, fontFamily: 'MaterialIcons'),
                        color: secondaryColor,
                        size: 30.0,
                  ),

                  AnimatedDigitWidget(
                    value: 300,
                    textStyle: _TextButtonStyle_HomePage,
                  )
                  ],),),
                SizedBox(
                  height: 200,width: 200,
                  child:
                  Column( 
                    children: [
                      Text('Trees planted',
                      style: _TextButtonStyle_HomePage,),
                      Icon(
                        IconData(0xf0603, fontFamily: 'MaterialIcons'),
                        color: secondaryColor,
                        size: 30.0,
                      ),
                    AnimatedDigitWidget(
                    value: 20,
                    textStyle: _TextButtonStyle_HomePage,
                  )
                      ,],),
                  ),],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                SizedBox(
                  height: 200,width: 200,
                  child:Column( 
                    children: [
                      Text('Total steps',
                      style:_TextButtonStyle_HomePage,),
                      Icon(
                        IconData(0xf6bd, fontFamily: 'MaterialIcons'),
                        color: secondaryColor,
                        size: 30.0,
                  ),
                  AnimatedDigitWidget(
                    value: 10000,
                    textStyle: _TextButtonStyle_HomePage,
                    separateSymbol: '.',
                  )
                  ],),),
                  SizedBox(
                  height: 200,width: 200,
                  child:Column( 
                    children: [
                      Text('Unused petrol',
                      style: _TextButtonStyle_HomePage,),
                      Icon(
                        IconData(0xea8e, fontFamily: 'MaterialIcons'),
                        color: secondaryColor,
                        size: 30.0,
                  ),
                  AnimatedDigitWidget(
                    value: 70,
                    textStyle: _TextButtonStyle_HomePage,
                  )
                  ],),),
                 ],
                ),
      ],),
    

    bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crisis_alert),
            label: 'Current Target',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'New Manual Activity',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor:primaryColor,
        selectedItemColor: secondarylightColor,
        selectedFontSize: 14.0,
        
        type: BottomNavigationBarType.fixed,

        onTap: (int index) {
          switch (index) {
            
            case 0:
            print(index);
                if(index!=0){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePageState ()));
                } else{print('still in the homepage ');}
                
              //break;
            case 1:
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CurrentTargetState ()));
              
              //break;
            case 2:
              
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AddActivityState ()));
              // Probably in this case you have to put an if: if the index is not pointing the home and you are in the case of the home, return to home
              break;
              }
            
              
            setState(() {
              _selectedIndex = index;
            },);
         },
        ),

    //floatingActionButton: FloatingActionButton(
          //child: const Icon(Icons.add),
          //onPressed: () {},
          //backgroundColor: secondaryColor,
          //elevation: 0.0,
          //splashColor: primaryLightColor,
          //),
    //floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
    );
  
  
  
  } //build

//-------------- Functions used trought the code 

Future<void> _launchUrl() async {if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');}}


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
}//HomePage