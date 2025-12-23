import 'package:exam_test/core/widgets/text_filed.dart';
import 'package:exam_test/feature/auth/provider/auth_provider.dart';
import 'package:exam_test/feature/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailContr = TextEditingController();
  TextEditingController _passContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, value, child) => Padding(
          padding: const .all(16),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              CustomTextField(label: 'Email', controller: _emailContr),
              SizedBox(height: 16),
              CustomTextField(label: 'Password', controller: _passContr),
              SizedBox(height: 32),

              ElevatedButton(
                onPressed: () async {
                  if (_emailContr.text.isNotEmpty &&
                      _emailContr.text.isNotEmpty) {
                    await value.loginUser(_emailContr.text, _passContr.text);
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (vale) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Siz ro'yxatdan o'tmagansiz!"),
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(12),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
