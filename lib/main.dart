import 'package:exam_test/feature/auth/provider/auth_provider.dart';
import 'package:exam_test/feature/auth/screens/sign_in_screen.dart';
import 'package:exam_test/feature/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(home: SignInScreen()),
    );
  }
}
