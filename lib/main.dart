// import 'package:emailpassword/add_data.dart';
// ignore: unused_import
import 'package:emailpassword/dirid.dart';
import 'package:emailpassword/firebase_options.dart';
import 'package:emailpassword/user.dart';
// import 'package:emailpassword/image.dart';
// import 'package:emailpassword/screen/widgets/sign_in.dart';
// import 'package:emailpassword/screen/widgets/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    // home: Uploadpicture(),
    // home: SignInPage(),
    // home: StreamFirebase(),
    home:LessonThirteen(),

  ));
}



  // This widget is the root of your application.
 
