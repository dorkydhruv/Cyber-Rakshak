import 'package:flutter/material.dart';

Widget buildTextField({double top = 10, required String hintText}) {
  return Container(
    margin: EdgeInsets.only(top: top, left: 20, right: 20, bottom: 20),
    child: TextField(
      obscureText: hintText == "Password" ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.black45,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
  );
}
