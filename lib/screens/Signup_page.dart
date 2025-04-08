import 'package:firebase_sample/providers/auth_controller.dart';
import 'package:firebase_sample/screens/Home_page.dart';
import 'package:firebase_sample/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Center(
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 35),

                // USER NAME
                TextFormField(
                  controller: userText,
                  decoration: const InputDecoration(
                    hintText: "USER NAME",
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a username";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // EMAIL
                TextFormField(
                  controller: emailText,
                  decoration: const InputDecoration(
                    hintText: "EMAIL",
                    suffixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an email";
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // PHONE
                TextFormField(
                  controller: phoneText,
                  decoration: const InputDecoration(
                    hintText: "PHONE",
                    suffixIcon: Icon(Icons.phone_android),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your phone number";
                    } else if (value.length < 10) {
                      return "Phone number must be at least 10 digits";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // PASSWORD
                TextFormField(
                  controller: passwordText,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "PASSWORD",
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: authController.isLoading
                      ? null
                      : () async {
                          try {
                            await authController.signUp(
                              userText.text,
                              emailText.text.trim(),
                              phoneText.text,
                              passwordText.text.trim(),
                            );
                            if (authController.user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                const Text(
                  "or",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Sign In With Google",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Already Have An Account",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                        // Navigate to login
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
