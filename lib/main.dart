import 'package:flutter/material.dart';
import 'package:newsapp/ui/router.dart' as route;
import 'package:provider/provider.dart';
import 'package:newsapp/locator.dart';
void main(){
    setupLocator();

  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        
      ],
      child: MaterialApp(
        title: 'NewsApp',
        theme: ThemeData(),
        initialRoute:route.initialRoute,
        onGenerateRoute:route.Router.generateRoute ,
      ),
    );
  }
} 