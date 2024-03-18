import 'package:flutter/material.dart';
import 'package:save_a_life_2024/Login_page/signup%20form.dart';

  class LoginForm extends StatelessWidget  {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return     Column(

      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'البريد الالكتروني',
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Space between email and password fields
            // Password Field
            Divider(
              thickness: 1,
              endIndent: MediaQuery.of(context).size.width * 0.06,
              indent: MediaQuery.of(context).size.width * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'كلمة المرور',
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // Forgot Password Text
            TextButton(
              onPressed: () {
                // Implement forgot password logic here
              },
              child: const Text(
                'هل نسيت كلمة المرور؟',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Lemonada',
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),

        // Login Button
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.001,
          child: ElevatedButton(
            onPressed: () {
              // Implement your login logic here
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(
                  horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'تسجيل الدخول',
              style: TextStyle(
                  fontSize: 10, fontFamily: 'Lemonada'),
            ),
          ),
        ),
      ],
    );
  }
}
