import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdl/NearbyService.dart';
import 'package:sdl/main.dart';

class CPSampleFormTypes extends StatefulWidget {
  const CPSampleFormTypes({Key? key}) : super(key: key);

  @override
  CPSampleFormTypesState createState() => CPSampleFormTypesState();
}

class CPSampleFormTypesState extends State<CPSampleFormTypes> {
  @override
  void initState() {
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
    return WillPopScope(
        onWillPop: () {
          context.read<PageController>().jumpToPage(Pages.home.index);
          return Future.value(false);
        },
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 246, 246),
            body: SafeArea(
                child: Column(children: [
              SizedBox(
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
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 40),
                child: Image.asset(
                  'assets/formtypes2.jpeg',
                  height: 100,
                  width: 150,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 200, bottom: 10),
                child: Image.asset(
                  'assets/Formtypes1.jpeg',
                  height: 100,
                  width: 150,
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 2),
                  margin: const EdgeInsets.only(top: 5, right: 25, left: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 60.0,
                    child: ElevatedButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        Provider.of<PageController>(context, listen: false)
                            .jumpToPage(Pages.savedForms.index);
                      },
                      child: const Text(
                        "EXISTING FORM",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 2),
                  margin: const EdgeInsets.only(top: 8, right: 25, left: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 60.0,
                    child: ElevatedButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        Provider.of<PageController>(context, listen: false)
                            .jumpToPage(Pages.sampleCreate.index);
                      },
                      child: const Text(
                        "NEW FORM",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 2),
                  margin: const EdgeInsets.only(top: 8, right: 25, left: 25),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 60.0,
                    child: ElevatedButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        Provider.of<NearbyService>(context, listen: false)
                          .savedForm = {
                            "type": "form",
                            "title": "Attendance",
                            "description": "Fill in your details",
                            "content": [
                              {
                                "type": QuestionTypes.singleLine.value,
                                "title": "Name",
                                "options": ["Option 1"],
                              },
                              {
                               "type": QuestionTypes.singleLine.value,
                                "title": "Roll number",
                                "options": ["Option 1"], 
                              }
                            ],
                          };
                        Provider.of<PageController>(context, listen: false)
                            .jumpToPage(Pages.sampleCreate.index);
                      },
                      child: const Text(
                        "ATTENDANCE",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ),
                  )),
            ]))));
  }
}
