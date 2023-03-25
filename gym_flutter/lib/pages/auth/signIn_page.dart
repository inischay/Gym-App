import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gym_flutter/pages/auth/signUp_page.dart';
import 'package:gym_flutter/pages/bottomBar.dart';
import 'package:gym_flutter/pages/mainScreen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A2F),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Please sign in to continue",
                  style: TextStyle(
                    color: Color.fromARGB(255, 211, 211, 211),
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                loginpage("Email", Icons.email),
                const SizedBox(
                  height: 20,
                ),
                loginpage("Password", Icons.lock),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 50),
                            backgroundColor: const Color(0xFF71F1E3)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomBarApp()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Color(0xFF1F1A2F)),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: RichText(
                        text: const TextSpan(text: "Forgot Password?"))),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(text: "Don't have an account?"),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage())),
                        text: "Sign Up",
                        style: const TextStyle(
                            color: Color(0xFF71F1E3),
                            fontWeight: FontWeight.bold))
                  ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container loginpage(
    String text,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 79, 67, 121)),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.white),
            hintText: text,
            labelStyle: const TextStyle(color: Colors.white),
            label: Text(text),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            )),
      ),
    );
  }
}
