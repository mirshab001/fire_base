import 'package:firebase_sample/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: TextButton(onPressed: () async { await
              authController.logOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text("Log Out")),
            ),
          ),
        ));
  }
}
