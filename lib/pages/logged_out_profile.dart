import 'package:flutter/material.dart';
import 'package:helping_hands/pages/login.dart';
import 'package:helping_hands/pages/sign_up.dart';

class LoggedOutProfilePage extends StatelessWidget {
  const LoggedOutProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox(
                height: 225.0,
                width: 225.0,
                child: Icon(
                  Icons.person_outline,
                  size: 225.0,
                ),
              ),
            ),
            const Text("You Are Not Logged in"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    ),
                    child: const Text("Sign Up"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
