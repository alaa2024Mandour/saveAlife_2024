import 'package:flutter/material.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';

import '../OnBording/on_bording.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  bool _isShowSignUp = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(246, 29, 25, 1),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/images/cerves pages/logo-removebg-preview.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    // Welcome Text
                    Text(
                      'مرحبا',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontFamily: 'Lemonada',
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    // Email and Password Fields Container
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/cerves pages/sign up user.png',
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Flexible(

                                  // Wrap with Flexible
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isShowSignUp = !_isShowSignUp;
                                      });
                                    },
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
                                ),
                                Flexible( // Wrap with Flexible
                                  fit: FlexFit.tight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isShowSignUp = !_isShowSignUp;
                                      });
                                    },
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
                              navigateTo(context, onBoardingScreen());
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
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    // Row for Google and Facebook login buttons
                    // Row for Google and Facebook login buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          // Add Expanded widget to ensure the button fits within the available space
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Implement Google login logic here
                            },
                            icon: const Icon(Icons.ac_unit_sharp),
                            label: const Text(
                              'تسجيل الدخول بجوجل',
                              style: TextStyle(
                                  fontFamily: 'Lemonada', fontSize: 10),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.red,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Space between Google and Facebook buttons
                        Expanded(
                          // Add Expanded widget to ensure the button fits within the available space
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Implement Facebook login logic here
                            },
                            icon: const Icon(Icons.facebook),
                            label: const Text('تسجيل الدخول بفيسبوك',
                                style: TextStyle(
                                    fontFamily: 'Lemonada', fontSize: 10)),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
