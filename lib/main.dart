import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdl/CPSampleFormTypes.dart';
import 'package:sdl/CreateForm.dart';
import 'package:sdl/Home.dart';
import 'package:sdl/NearbyService.dart';
import 'package:sdl/SampleCreate.dart';
import 'package:sdl/SampleCreateForm.dart';
import 'package:sdl/SampleFrontend.dart';
import 'package:sdl/SampleResponsePage.dart';
import 'package:sdl/SampleRooms.dart';
import 'package:sdl/savedForms.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool permission = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NearbyService(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color.fromARGB(183, 206, 230, 241)),
          inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF50C2C9)))),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.brown,
            selectionColor: Colors.black,
            selectionHandleColor: Colors.brown,
          ),
          textTheme: const TextTheme(
              subtitle1: TextStyle(
                  color: Color.fromARGB(151, 0, 0, 0), fontFamily: 'Poppins')),
        ),
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: generateRoute,
        // initialRoute: '/',
        home: const PageViewWidget(),
      ),
    );
  }
}

enum Pages {
  home,
  createForm,
  // rooms,
  // responsePage,
  // sampleFrontend,
  sampleCreateForm,
  sampleCreate,
  cpSampleFormTypes,
  sampleRooms,
  sampleResponsePage,
  
  savedForms
}

// PageViewWidget

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  PageViewWidgetState createState() => PageViewWidgetState();
}

class PageViewWidgetState extends State<PageViewWidget> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageController.addListener(() {
        if (pageController.page == Pages.home.index ||
            pageController.page == Pages.createForm.index ||
            pageController.page == Pages.home.index ||
            pageController.page == Pages.sampleCreate.index) {
          NearbyService().stopAdvertising();
          NearbyService().stopDiscovery();
          NearbyService().stopAllEndpoints();
          NearbyService().payloads = [{}];
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (!mounted) return;
    NearbyService nearbyService = context.watch<NearbyService>();

    // Go to connected page from create
    if (nearbyService.connectedDevices.isNotEmpty &&
        (pageController.page == Pages.createForm.index ||
            pageController.page == Pages.sampleCreate.index) &&
        nearbyService.isSharing &&
        !nearbyService.payloads[0].containsKey("contentType")) {
      nearbyService.payloads = [
        {"type": "share", "contentType": "ack"}
      ];
      pageController.jumpToPage(Pages.sampleResponsePage.index);
    }

    // Handle Error
    if (nearbyService.error != null) {
      nearbyService.foundDevices = {};
      NearbyService().stopAllEndpoints();
    }

    // Exit chat if disconnected
    if (nearbyService.error != null ||
        (nearbyService.connectedDevices.isEmpty &&
            (nearbyService.payloads[0].containsKey("type")
                ? nearbyService.payloads[0]["type"] == "share"
                : false))) {
      nearbyService.payloads = [{}];
      pageController.jumpToPage(Pages.home.index);
    }
    nearbyService.error = null;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: pageController,
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Home(),
          CreateForm(),
          // Rooms(), 
          // ResponsePage(),
          // SampleFrontend(), 
          SampleCreateForm(), 
          SampleCreate(),
          CPSampleFormTypes(),
          SampleRooms(),
          SampleResponsePage(),
          
          SavedForms()
        ],
      ),
    );
  }
}
