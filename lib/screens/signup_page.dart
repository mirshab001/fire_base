import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({
    super.key,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                "SignUp",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
            ),
            TextFormField(
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email",
                  suffixIcon: Icon(Icons.mail_outline),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: isObscured,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      icon: Icon(isObscured
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Phone",
                  suffixIcon: Icon(Icons.phone_android),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    ));
  }
}






















































































































































































































































































































































































// import 'package:flutter/material.dart';
//
// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});
//
//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool isObscured = true;
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//
//   // Function to validate email format
//   bool isValidEmail(String email) {
//     return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
//         .hasMatch(email);
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // If form is valid, proceed with signup logic
//       print("Signup Successful!");
//       print("Name: ${_nameController.text}");
//       print("Email: ${_emailController.text}");
//       print("Phone: ${_phoneController.text}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               const Center(
//                 child: Text(
//                   "SignUp",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 50),
//                 ),
//               ),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                     hintText: "Name",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return "Name cannot be empty";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                     hintText: "Email",
//                     suffixIcon: const Icon(Icons.mail_outline),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return "Email cannot be empty";
//                   } else if (!isValidEmail(value)) {
//                     return "Enter a valid email";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: isObscured,
//                 decoration: InputDecoration(
//                     hintText: "Password",
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isObscured = !isObscured;
//                           });
//                         },
//                         icon: Icon(isObscured
//                             ? Icons.visibility_off
//                             : Icons.visibility)),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 validator: (value) {
//                   if (value == null || value.length < 6) {
//                     return "Password must be at least 6 characters";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                     hintText: "Phone",
//                     suffixIcon: const Icon(Icons.phone_android),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20))),
//                 validator: (value) {
//                   if (value == null || value.length < 10) {
//                     return "Enter a valid phone number";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: const Text("Sign Up"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
