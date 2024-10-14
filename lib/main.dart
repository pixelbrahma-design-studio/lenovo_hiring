import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:lenovo_hiring/CampusHiring2025.dart';
import 'package:lenovo_hiring/LandingPage/AboutSmartSprint.dart';
import 'package:lenovo_hiring/LandingPage/LandingPage.dart';
import 'package:lenovo_hiring/LandingPage/rules.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/admin/add_question.dart';
import 'package:lenovo_hiring/about_lenovo.dart';
import 'package:lenovo_hiring/admin/add_quiz.dart';
import 'package:lenovo_hiring/controllers/quiz_controller/quiz_state.dart';
import 'package:lenovo_hiring/firebase_options.dart';
import 'package:lenovo_hiring/count_down.dart';
import 'package:lenovo_hiring/footer/footer.dart';
import 'package:lenovo_hiring/campus_hiring_2025.dart';
import 'package:lenovo_hiring/login.dart';
import 'package:lenovo_hiring/quiz.dart';
import 'package:lenovo_hiring/quiz_result.dart';
import 'package:lenovo_hiring/register.dart';
import 'package:lenovo_hiring/smartsprint.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

//import 'smartsprint.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //setupSmartsprint();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => QuizState()),
  ], child: const MyApp()));
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
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return "/count_down";
            }
          },
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
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return "/count_down";
            }
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return "/count_down";
            }
          },
        ),
        GoRoute(
          path: '/count_down',
          builder: (context, state) => const CountDown(),
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser == null) {
              return "/";
            }
          },
        ),
        GoRoute(
          path: '/add-question',
          builder: (context, state) => const AddQuestion(),
          // redirect: (context, state) {
          //   if (FirebaseAuth.instance.currentUser == null) {
          //     return "/";
          //   }
          //}
        ),
        // GoRoute(
        //   path: '/about-lenovo',
        //   builder: (context, state) => const AboutLenovoPage(),
        // ),
        GoRoute(
          path: '/quiz',
          builder: (context, state) => const QuizPage(),
        ),
        GoRoute(
          path: '/quiz_result',
          builder: (context, state) => const QuizResult(),
        ),
        GoRoute(
          path: '/about_lenovo',
          builder: (context, state) => const AboutLenovoPage(),
        ),
        GoRoute(
          path: '/add-quiz',
          builder: (context, state) => AddQuiz(),
        ),
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
