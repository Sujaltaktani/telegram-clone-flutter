import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone_flutter/log.dart';
import 'package:telegram_clone_flutter/screens/light_mode/home_screen.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      theme: ThemeData(
          primaryColor: Color(0xFF5682a3),
          // accentColor: Color(0xFFe7ebf0),
          backgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: MyAppLogin(),
    );
  }
}