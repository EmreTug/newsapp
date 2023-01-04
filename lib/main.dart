import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/ui/router.dart' as route;
import 'package:provider/provider.dart';
import 'package:newsapp/locator.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       MaterialApp(
         title: 'NewsApp',
         theme: ThemeData(),
         initialRoute: route.initialRoute,
         onGenerateRoute: route.Router.generateRoute,
         debugShowCheckedModeBanner: false,
         
       );
    
  }
}
