import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/ui/router.dart' as route;
import 'package:provider/provider.dart';
import 'package:newsapp/locator.dart';
import 'core/model/user.dart';
import 'core/services/auth_service.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>(
      initialData: UserModel.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'NewsApp',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
           scaffoldBackgroundColor: Colors.white
        ),
        initialRoute: route.initialRoute,
        onGenerateRoute: route.Router.generateRoute,
        debugShowCheckedModeBanner: false,

        
      ),
    );
  }
}
