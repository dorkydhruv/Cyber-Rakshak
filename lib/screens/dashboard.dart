import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/services/criminal_record.dart';
import 'package:cyber_rakshak/screens/services/new_case.dart';
import 'package:cyber_rakshak/widgets/containerPage.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                "Good Morning",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              subtitle: const Text(
                "IPS Seema Gupta",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              trailing: Container(
                width: MediaQuery.of(context).size.width * 0.32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 35,
                      ),
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/ips.png"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Making",
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "Investigation, ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 109, 64, 255),
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: "Easier!",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ))
                        ]),
                  ),
                ],
              ),
            ),
            const Text(
              "     Services",
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                allowImplicitScrolling: true,
                children: [
                  ContainerPage(
                    img: "new_case",
                    str: "New Case",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const NewCasePage())),
                  ),
                  ContainerPage(
                    img: "record",
                    str: "Criminal Record",
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CriminalRecord())),
                  ),
                  ContainerPage(img: "invest", str: "Investigation"),
                  ContainerPage(img: "evidence", str: "Evidence Room"),
                  ContainerPage(img: "completeFile", str: "Complete File"),
                ],
              ),
            ),
          ],
        ));
  }
}
