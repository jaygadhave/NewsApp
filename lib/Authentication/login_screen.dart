import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/Authentication/service/googleauth.dart';
import 'package:news/Authentication/signup_screen.dart';
import 'package:news/news_blogs/home_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    GoogleAuth googleAuth = GoogleAuth();
    bool load = false;
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF000000),
        title: const Center(child: Text('Login Screen')),
      ),
      backgroundColor: Color(0XFF464646),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email & Password Fields
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white.withOpacity(0.3)), // Set the desired color
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _email.text, password: _password.text)
                        .then(
                            (value) => Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                  (route) => false, // Remove all routes on top
                                ));
                  },
                  child: const Text('Login '),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'New',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                // Phone Number Authentication

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white.withOpacity(0.3)), // Set the desired color
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text('Signup'),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'or',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: dButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white.withOpacity(0.3)), // Set the desired color
                  ),
                  onPressed: () async {
                    setState(() {
                      load = true;
                    });
                    await googleAuth.googleSignIn(context);
                    setState(() {
                      load = false;
                    });
                  },
                  child: Text('Google'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
