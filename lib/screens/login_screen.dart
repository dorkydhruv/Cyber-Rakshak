import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/dashboard.dart';
import 'package:cyber_rakshak/widgets/buildTextField.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: const AssetImage(
                "assets/login.png",
              ),
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            buildTextField(hintText: "Username"),
            buildTextField(top: 5, hintText: "Password"),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
            CustomButton(
              str: "Sign In",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DashBoard()),
                    (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
