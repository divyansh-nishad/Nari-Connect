import 'package:nari_connect/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nari_connect/components/my_button.dart';
import 'package:nari_connect/components/my_textfield.dart';
import 'package:nari_connect/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongErrorMessage(e.message!);
      // if (e.code == 'user-not-found') {
      //   wrongEmailMessage();
      // } else if (e.code == 'wrong-password') {
      //   wrongPasswordMessage();
      // }
    }
    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: emailController.text,
    //   password: passwordController.text,
    // );
  }

  // void wrongEmailMessage() {
  //   showDialog(
  //     context: context,
  //     builder: ((context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Text('Email not registered',
  //             style: TextStyle(color: Colors.white)),
  //       );
  //     }),
  //   );
  // }

  // void wrongPasswordMessage() {
  //   showDialog(
  //     context: context,
  //     builder: ((context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title:
  //             Text('Incorrect Password', style: TextStyle(color: Colors.white)),
  //       );
  //     }),
  //   );
  // }

  void wrongErrorMessage(String message) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Text(message, style: TextStyle(color: Colors.white)),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 40),

                // logo
                // const Icon(
                //   Icons.lock,
                //   size: 100,
                // ),
                Image.asset(
                  'assets/images/login.png',
                  height: 200,
                ),

                const SizedBox(height: 40),

                // welcome back, you've been missed!
                Text(
                  'Welcome back to Nari Connect',
                  style: TextStyle(
                    color: Colors.brown.shade300,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.brown.shade300),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // sign in button
                MyButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),

                const SizedBox(height: 40),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown.shade300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.brown.shade300),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown.shade300,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'assets/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(
                        onTap: () {}, imagePath: 'assets/images/facebook.png')
                  ],
                ),

                const SizedBox(height: 40),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.brown.shade300),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
