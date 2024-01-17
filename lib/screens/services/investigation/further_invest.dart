import 'package:cyber_rakshak/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FurtherInvestigation extends StatelessWidget {
  const FurtherInvestigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              // alignment: Alignment.bo
              // ,

              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: 20,
                left: 20,
                right: 20,
              ),

              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage(
                    "assets/invest.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Image(
                              image: AssetImage("assets/ips.png")))),
                  title: const Text(
                    "Investigation officer ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: "Poppins"),
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Investigation",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
