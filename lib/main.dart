import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_series/auth/singup.dart';
import 'package:get/get.dart';
import 'firebase_options.dart'; // 👈 Ye file FlutterFire CLI ne generate ki hai
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // 👈 Platform specific config
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
