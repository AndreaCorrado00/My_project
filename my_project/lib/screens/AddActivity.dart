import 'package:flutter/material.dart';
import 'package:my_project/screens/CurrentTarget.dart';
import 'package:my_project/screens/HomePage.dart';
import 'constants.dart';

class AddActivityState extends StatefulWidget {
  const AddActivityState ({super.key});

  @override
  State<AddActivityState > createState() => AddActivity();
}

class AddActivity extends State<AddActivityState> {


  static final _TextButtonStyle_Drawer=TextButton.styleFrom(
                foregroundColor: secondarylightColor,
                shadowColor: secondaryColor,
                fixedSize: const Size(250, 50),
                alignment: const Alignment(-0.8, 0),
                textStyle: const TextStyle(
                fontFamily: myfontFamily,
                fontSize: 20.0,
              ));
  static const _TextButtonStyle_HomePage=TextStyle(
                        fontFamily: myfontFamily,
                        fontSize: 25.0,
                        color:secondaryColor,
                      );
  static const routename = 'AddActivityPage';
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    print('${AddActivity.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new green activity'),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: primaryLightColor,
      //body: TO BE IMPLEMENTED
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

        onTap: (int index) {
          print('swich $index');
          // Need to handle the interaction between pages 
          switch (index) {
            
            case 0:
            print(index);
            //if(index!=1){index=1;}
                
                  Navigator.push(context,MaterialPageRoute(builder: (context) => HomePageState()));
              //break;
            case 1:
                Navigator.push(context,MaterialPageRoute(builder: (context) => CurrentTargetState()));
                
              //break;
            case 2:
              if(index!=2){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AddActivityState()));
                } else{print('still in the AddActivityPage ');}
              //if(index!=1){index=1;}
              // Probably in this case you have to put an if: if the index is not pointing the home and you are in the case of the home, return to home
              break;
              }
            
              
            setState(() {
              _selectedIndex = index;
            },);
         },
        ),
      );
  } //build

} //HomePage