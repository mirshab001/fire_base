import 'package:flutter/material.dart';
import 'package:my_app/screens/home_page.dart';
import 'package:my_app/screens/login_page.dart';
import 'package:my_app/validator/validator.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signupKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController createController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  bool isVisible = true;
  bool isnotVisible = true;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: signupKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "facebook",
                      style: TextStyle(
                        color: Color.fromARGB(255, 43, 46, 200),
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color.fromARGB(255, 49, 53, 186),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: usernameController,
                      validator: (value) =>
                          AppValidator.validateField(value, "Username"),
                      decoration: InputDecoration(
                          labelText: "UserName",
                          hintText: "Enter your username",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) =>
                          AppValidator.validateField(value, "Email"),
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) =>
                          AppValidator.validateField(value, "Phone number"),
                      decoration: InputDecoration(
                          labelText: "Phone number",
                          hintText: "Enter your phone number",
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: isnotVisible,
                      controller: createController,
                      validator: (value) =>
                          AppValidator.passwordValidator(value),
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onLongPress: () {
                              setState(() {
                                isnotVisible = false;
                              });
                            },
                            onLongPressUp: () {
                              setState(() {
                                isnotVisible = true;
                              });
                            },
                            child: Icon(isnotVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          labelText: "Create Password",
                          hintText: "Enter your password",
                          // suffixIcon: GestureDetector(
                          //     child: const Icon(Icons.remove_red_eye_sharp)),
                          prefixIcon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: isVisible,
                      controller: confirmController,
                      validator: (value) => AppValidator.cPasswordValidate(
                          value, createController.text),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          labelText: "Confirm password",
                          hintText: "Enter your currect password",
                          prefixIcon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (signupKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    // ignore: prefer_const_constructors
                                      builder: (context) => HomePage()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromARGB(255, 44, 46, 159)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            // color: Colors.black,
                            thickness: 3,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("OR"),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 3,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                              WidgetStatePropertyAll(Colors.green),
                              shape: WidgetStatePropertyAll(LinearBorder())),
                          child: const Text(
                            "Back to Login Page",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                            onPressed: () {}, child: const Text("Login")),
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