import 'dart:convert';
import 'dart:io';
// import 'dart:ffi';
// import 'dart:typed_data';
import 'dart:typed_data';

import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/investigation/predictions.dart';
import 'package:cyber_rakshak/widgets/buildTextField.dart';
import 'package:cyber_rakshak/widgets/button.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Investigation extends StatefulWidget {
  const Investigation({super.key});

  @override
  State<Investigation> createState() => _InvestigationState();
}

class _InvestigationState extends State<Investigation> {
  bool modelLoaded = false;
  final TextEditingController _caseController = TextEditingController();
  final TextEditingController _ticketController = TextEditingController();

  // Interpreter interpreter = Interpreter.fromFile(File("assets/model.tflite"));
  late Interpreter interpreter;

  @override
  void initState() {
    // TODO: implement initState
    loadModel();
    super.initState();
  }

  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset('assets/model.tflite');
    setState(() {
      modelLoaded = true;
    });
    print("Model loadded");
  }

  String runInference(String input) {
    // Get the input and output tensors from the TensorFlow Lite interpreter
    final inputTensors = interpreter.getInputTensors();
    final outputTensors = interpreter.getOutputTensors();

    if (inputTensors.isNotEmpty && outputTensors.isNotEmpty) {
      // Get the types of the input and output tensors
      final inputType = inputTensors[0].type;
      final outputType = outputTensors[0].type;

      final inputBytes = utf8.encode(input);
      final inputBuffer = Uint8List.fromList(inputBytes);

      final outputBufferLength = outputTensors[0].shape.reduce((a, b) => a * b);
      final outputBuffer = Uint8List(outputBufferLength);

      interpreter.run(inputBuffer.buffer, outputBuffer.buffer);

      final outputString = utf8.decode(outputBuffer);
      print(outputString);
      return outputString;
    }

    return '';
  }

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
                icon: SvgPicture.asset("assets/back.svg"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.4,
                  image: AssetImage("assets/invest.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Center(
                  child: Text(
                "Investigation",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 28),
              )),
            ),
            buildContainer("Case Brief *", 40, _caseController),
            // Row(chi)
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "---------------------- OR --------------------------",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Poppins", fontSize: 12),
              ),
            ),
            buildContainer("Ticket number", 40, _ticketController),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              str: "Let's Investigate",
              onPressed: () {
                runInference(_caseController.text);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Predictions()));
              },
            )
          ],
        ),
      ),
    );
  }

  buildContainer(String hintText, double h, TextEditingController? controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              hintText: "",
              textEditingController: controller,
              top: 5,
              left: 0,
              right: 0,
              bottom: 0,
              h: h),
        ],
      ),
    );
  }
}
