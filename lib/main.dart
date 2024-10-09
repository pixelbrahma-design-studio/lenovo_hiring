import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:lenovo_hiring/CampusHiring2025.dart';
import 'package:lenovo_hiring/LandingPage/AboutSmartSprint.dart';
import 'package:lenovo_hiring/LandingPage/LandingPage.dart';
import 'package:lenovo_hiring/LandingPage/rules.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/firebase_options.dart';
import 'package:lenovo_hiring/footer/footer.dart';
import 'package:lenovo_hiring/campus_hiring_2025.dart';
import 'package:lenovo_hiring/register.dart';
import 'package:lenovo_hiring/smartsprint.dart';
import 'package:go_router/go_router.dart';

//import 'smartsprint.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //setupSmartsprint();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MyHomePage(),
        ),
        GoRoute(
          path: '/smartsprint',
          builder: (context, state) => const Smartsprint(),
        ),
        GoRoute(
          path: '/campus-hiring-2025',
          builder: (context, state) => const Campus_Hiring(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterPage(),
        ),
        // GoRoute(
        //   path: '/login',
        //   builder: (context, state) => const LoginPage(),
        // ),
        // GoRoute(
        //   path: '/about-lenovo',
        //   builder: (context, state) => const AboutLenovoPage(),
        // ),
      ],
    );

    return MaterialApp.router(
      title: 'Lenovo Hiring',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Gotham",
        useMaterial3: true,
      ),
      routerConfig: _router,
      //home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromRGBO(222, 6, 191, 1.0),
              Color.fromRGBO(77, 20, 74, 1.0)
            ]),
            image: DecorationImage(
              image: AssetImage("assets/images/grid.png"),
              repeat: ImageRepeat.repeatY,
              opacity: 0.5,
              fit: BoxFit.cover,
            )),
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              LandingPage(),
              Aboutsmartsprint(),
              Rules(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
