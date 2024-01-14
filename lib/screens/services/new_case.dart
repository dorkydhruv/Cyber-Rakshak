import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/widgets/buildTextField.dart';
import 'package:flutter/material.dart';

class NewCasePage extends StatelessWidget {
  const NewCasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: const Image(image: AssetImage("assets/ips.png")))),
              title: const Text(
                "Investigation officer ",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: "Poppins"),
              ),
              subtitle: const Text(
                'IPS Shruti',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 28),
              ),
              trailing: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            buildContainer("Expected Attack", 40),
            buildContainer("Location and Time (IST) of FIR", 40),
            buildContainer("Describe the incident", 70),
            buildContainer("Attach files", 40),
            buildContainer("Date and Location of incident", 40),
            buildContainer("Investigator", 40),
          ],
        ),
      ),
    );
  }

  buildContainer(String hintText, double h) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          buildTextField(
              hintText: "", top: 5, left: 0, right: 0, bottom: 0, h: h),
        ],
      ),
    );
  }
}
