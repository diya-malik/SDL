import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import 'package:sdl/main.dart';

class SampleFrontend extends StatefulWidget {
  const SampleFrontend({Key? key}) : super(key: key);

  @override
  SampleFrontendState createState() => SampleFrontendState();
}

class SampleFrontendState extends State<SampleFrontend> {
  @override
  void initState() {
    // void activate() {
    super.initState();
    super.activate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: const Color(0XFF50C2C9),
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color.fromARGB(255, 248, 246, 246),
          body: SafeArea(
              child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.30,
                child: Stack(children: [
                  Positioned(
                      top: -10,
                      left: -110,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: 250,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0x738FE1D7)),
                      )),
                  Positioned(
                      top: -110,
                      left: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: 250,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0x738FE1D7)),
                      )),
                ])),
            const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Welcome',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))),
            const Image(image: AssetImage('assets/welcomeScreenImg.png')),
            // const Padding(
            //     padding: const EdgeInsets.only(top: 30),
            //     child: const Text(
            //       'Go Ahead',
            //       style: const TextStyle(
            //         fontFamily: 'Poppins',
            //         fontSize: 17.0,
            //         color: Colors.black,
            //         fontWeight: FontWeight.normal,
            //       ),
            //     )),
            Container(
                padding: const EdgeInsets.only(top: 15),
                margin: const EdgeInsets.only(top: 25, right: 25, left: 25),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 60.0,
                  child: ElevatedButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Provider.of<PageController>(context, listen: false)
                          .jumpToPage(Pages.sampleRooms.index);
                    },
                    child: const Text(
                      "JOIN ROOM",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
            Container(
                margin: const EdgeInsets.all(25),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 60.0,
                  child: ElevatedButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      // Provider.of<PageController>(context, listen: false)
                      //     .jumpToPage(Pages.cpSampleFormTypes.index);
                      Provider.of<PageController>(context, listen: false)
                          .jumpToPage(Pages.sampleCreate.index);
                    },
                    child: const Text(
                      "CREATE ROOM",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
          ])));
  }
}
