import 'dart:convert';
import 'dart:io';
import 'package:my_project/Database/entities/todo.dart';
import 'package:my_project/Database/repositories/databaseRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_project/Models/Steps.dart';
import 'package:my_project/utils/impact.dart';
import 'package:my_project/utils/constants.dart';
import 'package:animated_digit/animated_digit.dart';

//HomePage can be Steless. Only the ListView content changes, not the HomePage by itself.
class databaseCodes extends StatelessWidget {
  databaseCodes({Key? key}) : super(key: key);

  static const routename = 'databaseCodes';
  final today='2023-05-16';

  @override
  Widget build(BuildContext context) {
    print('${databaseCodes.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(databaseCodes.routename),
      ),
      //The FAB is used to add random entries to the Todo table
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await  _getAndStoreTokens();
            int steps= await _getStep(today);
            
            //No need to use a Consumer, we are just using a method of the DatabaseRepository
            await Provider.of<DatabaseRepository>(context, listen: false)
                .insertTodo(Todo(null, steps));
          },
          child: const Icon(Icons.add)),
      body: Center(
        child:
          //We will show the todo table with a ListView.
          //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
          //entries are deleted or created.
          Consumer<DatabaseRepository>(
            builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Todo using dbr.findAllTodos()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllTodos() is a Future.
          return FutureBuilder(
            initialData: null,
            future: dbr.findAllTodos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List<Todo>;
                return    
                // ClipRRect(
                   
                //       borderRadius: BorderRadius.circular(20),
                //       child: Container(
                          
                //           height: 150,
                //           width: 150,
                //           color: Constants.thirdColor,
                //           child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   'Total steps',
                //                   style: Constants.TextButtonStyle_HomePage,
                //                 ),
                //                 SizedBox(height: 20),
                //                 AnimatedDigitWidget(
                //                   value:  int.parse(),
                //                   textStyle: Constants.TextButtonStyle_HomePage,
                //                 ),
                //                 const Icon(
                //                   IconData(0xf6bd, fontFamily: 'MaterialIcons'),
                //                   color: Constants.secondaryColor,
                //                   size: 30.0,
                //                 )
                //               ])),
                //     )
                // ;}
                 ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, todoIndex) {
                      final todo = data[todoIndex];
                      return Card(
                        elevation: 5,
                        //Here we use a Dismissible widget to create a nicer UI.
                        child: Dismissible(
                          //Just create a dummy unique key
                          key: UniqueKey(),
                          //This is the background to show when the ListTile is swiped
                          background: Container(color: Colors.red),
                          //The ListTile is used to show the Todo entry
                          child: ListTile(
                            leading: const Icon(Icons.note),
                            title: Text(todo.daily_steps.toString()),
                            subtitle: Text('ID: ${todo.id}'),
                            //If the ListTile is tapped, it is deleted
                          ),
                          //This method is called when the ListTile is dismissed
                          onDismissed: (direction) async {
                            //No need to use a Consumer, we are just using a method of the DatabaseRepository
                            await Provider.of<DatabaseRepository>(context,
                                    listen: false)
                                .removeTodo(todo);
                          },
                        ),
                      );
                    });} 
                else {
                //CircularProgressIndicator is shown while the list of Todo is loading.
                return CircularProgressIndicator();
              } //else
            },//builder of FutureBuilder
          );
        }),
      ),
    );
  } //build
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
  
  Future _getStep(today)async{
    final sp=await SharedPreferences.getInstance();
    var access=sp.getString('access');
    if (access == null){
      return null;
    }
    else{
      if(JwtDecoder.isExpired(access)){
        await _refreshTokens();
        access = sp.getString('access');
      }
      
      final url=Impact.baseUrl+Impact.stepEndpoint + '/patients/Jpefaq6m58'+'/day/$today/';

      final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'}; //fixed costruction!

      final response = await http.get(Uri.parse(url), headers: headers);

      // Now we have made the request and, probably, the response. But how to get data?

      //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      List result = [];
      List steps_data=[];
      final total_steps=0;
      for (var i = 0; i < decodedResponse['data']['data'].length; i++) {
        print('iteration $i');
        print(result);
        result.add(Steps.fromJson(decodedResponse['data']['date'], decodedResponse['data']['data'][i]));
        steps_data.add(Steps.fromJson(decodedResponse['data']['date'], decodedResponse['data']['data'][i]).getValue());
      }//for
      int out=steps_data.reduce((a, b) => a + b);
      return out;
    } //if
    else{
      void result = null;
    }//else
    
    }
    

  }//getStep
} 