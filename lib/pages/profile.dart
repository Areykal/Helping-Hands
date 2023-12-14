import 'package:flutter/material.dart';
import 'package:helping_hands/pages/logged_out_profile.dart';
import 'package:helping_hands/pages/login.dart';
import 'package:helping_hands/pages/sign_up.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 68,
                  vertical: 36,
                ),
                height: 225.0,
                width: 225.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Text(
              "Ho Areykal",
              textAlign: TextAlign.center,
            ),
            const Text(
              "Age: 20",
              textAlign: TextAlign.center,
            ),
            const Text(
              "Volunteer Hours Done: 50",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              ),
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              ),
              child: const Text("Sign Up"),
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoggedOutProfilePage(),
                      ),
                    ),
                child: const Text("Logged Out Profile"))
          ],
        ),
      ),
    );
  }
}
