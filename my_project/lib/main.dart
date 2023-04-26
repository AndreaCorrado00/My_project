import 'package:flutter/material.dart';
import 'package:my_project/Providers/Daily_advice_counter.dart';
import 'package:provider/provider.dart';
import 'package:my_project/screens/LoginPage.dart';
void main() {
  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>Daily_index())],
    child:MyApp()));}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginPage(),
    );
  }
}

