import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});


  @override
  Widget build(BuildContext context) {
    return  Stack(

      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Flexible(
                  flex: 2,
                  // Wrap with Flexible
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontFamily: 'Lemonada',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                Flexible(
                  flex: 4,
                  // Wrap with Flexible
                  fit: FlexFit.tight,
                  child: Text(
                    'ليس لديك جساب؟',
                    style: TextStyle(
                      fontFamily: 'Lemonada',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
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
