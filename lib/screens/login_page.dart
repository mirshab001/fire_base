//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/auth_controller.dart';
// import 'Home_page.dart';
// import 'Signup_page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authController = Provider.of<AuthController>(context);
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Log In",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     prefixIcon: const Icon(Icons.email),
//                   ),
//                   style: const TextStyle(color: Colors.black),
//                 ),
//                 const SizedBox(height: 25),
//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     labelStyle: const TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon:
//                     const Icon(Icons.visibility, color: Colors.black),
//                   ),
//                   style: const TextStyle(color: Colors.black),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   onPressed: authController.isLoading
//                       ? null
//                       : () async {
//                     try {
//                       await authController.login(
//                         emailController.text.trim(),
//                         passwordController.text.trim(),
//                       );
//                       if (authController.user != null) {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                               builder: (_) => const HomePage()),
//                         );
//                       }
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(e.toString())),
//                       );
//                     }
//                   },
//                   child: authController.isLoading
//                       ? const CircularProgressIndicator(
//                     color: Colors.white,
//                   )
//                       : const Text(
//                     "Log in",
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don’t have an account?",
//                         style: TextStyle(color: Colors.black)),
//                     const SizedBox(width: 5),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(builder: (_) => const SignupPage()),
//                         );
//                       },
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(
//                             color: Colors.red, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:firebase_sample/screens/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_controller.dart';
import 'Signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.security),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()));
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: Colors.green),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                          onPressed: authController.isLoading
                              ? null
                              : () async {
                            try {
                              await authController.login(
                                email.text.trim(),
                                pass.text.trim(),
                              );
                              if (authController.user != null) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          },
                          child: authController.isLoading
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : const Text(
                            "Log in",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                )),
          ),
        ));
  }
}