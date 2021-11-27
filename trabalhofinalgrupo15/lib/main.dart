import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalgrupo15/models/request_manager.dart';
import 'package:trabalhofinalgrupo15/models/user_manager.dart';
import 'package:trabalhofinalgrupo15/screens/base/base_screen.dart';
import 'package:trabalhofinalgrupo15/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => RequestManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Rede Prime Automotive',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.yellow,
            inputDecorationTheme: InputDecorationTheme(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 210, 174, 109)))),
            scaffoldBackgroundColor: const Color.fromARGB(255, 86, 86, 86),
            appBarTheme: const AppBarTheme(elevation: 0),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 86, 86, 86),
            ))),
        home: LoginScreen(),
      ),
    );
  }
}
