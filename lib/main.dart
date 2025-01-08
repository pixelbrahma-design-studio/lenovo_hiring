import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/Count_Down/coundown_state.dart';
import 'package:lenovo_hiring/LandingPage/AboutSmartSprint.dart';
import 'package:lenovo_hiring/LandingPage/LandingPage.dart';
import 'package:lenovo_hiring/LandingPage/rules.dart';
import 'package:lenovo_hiring/LandingPage/why-participate.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/admin/add_admin_screen.dart';
import 'package:lenovo_hiring/admin/add_question.dart';
import 'package:lenovo_hiring/about_lenovo.dart';
import 'package:lenovo_hiring/admin/add_quiz.dart';
import 'package:lenovo_hiring/forgot_password.dart';
import 'package:lenovo_hiring/leader_board_screen/quize_list_screen.dart';

import 'package:lenovo_hiring/repository/attendee/attendee_state.dart';
import 'package:lenovo_hiring/repository/auth/auth_repository.dart';
import 'package:lenovo_hiring/repository/auth/auth_state.dart';
import 'package:lenovo_hiring/leader_board_screen/leader_board_list.dart';
import 'package:lenovo_hiring/repository/leader_board/leader_board_state.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_state.dart';
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
import 'package:lenovo_hiring/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => QuizState()),
    ChangeNotifierProvider(create: (context) => AuthState()),
    ChangeNotifierProvider(create: (context) => AttendeeState()),
    ChangeNotifierProvider(create: (context) => LeaderBoardState()),
    ChangeNotifierProvider(create: (context) => CoundownState()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AuthRepository authRepository = AuthRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MyHomePage(), // Splash or Login Page
          redirect: (context, state) {
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if(user.emailVerified) {
                return '/count_down';
                // return '/splash_screen';
              } else {
                return '/splash_screen';
              }
            }
            return null; // Stay on '/'
          },
        ),
        GoRoute(
          path: '/splash_screen',
          builder: (context, state) => const SplashScreen(),
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
            final user = FirebaseAuth.instance.currentUser;
            if(user != null) {
              if(user.emailVerified) {
                return '/count_down';
                // return '/splash_screen';
              } else {
                return '/splash_screen';
              }
            }
          },
        ),
        GoRoute(
          path: '/count_down',
          builder: (context, state) => const CountDown(),
          redirect: (context, state) {
            final user = FirebaseAuth.instance.currentUser;
            if(user != null) {
              if(user.emailVerified) {
                return '/count_down';
                // return '/splash_screen';
              } else {
                return '/splash_screen';
              }
            } else {
              return '/';
            }
          },
        ),

        GoRoute(
            path: '/add-question',
            builder: (context, state) => const AddQuestion(),
            redirect: (context, state) {
              print(context.read<AuthState>().user?.role);
              if (context.read<AuthState>().user == null ||
                  context.read<AuthState>().user?.role != "admin") {
                return "/";
              }
              return null;
            }),
        GoRoute(
            path: '/quiz',
            builder: (context, state) {
              return QuizPage();
            }),

        GoRoute(
            path: '/quiz-list',
            builder: (context, state) {
              return QuizListScreen();
            }),

        GoRoute(
            path: '/leader-board',
            builder: (context, state) {
              return LeaderBoardList();
            }),
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
            redirect: (context, state) {
              print(context.read<AuthState>().user?.role);
              if (context.read<AuthState>().user == null ||
                  context.read<AuthState>().user?.role != "admin") {
                return "/";
              }
              return null;
            }),
        GoRoute(
            path: '/add-admin',
            builder: (context, state) => AddAdminScreen(),
            redirect: (context, state) {
              print(context.read<AuthState>().user?.role);
              if (context.read<AuthState>().user == null ||
                  context.read<AuthState>().user?.role != "admin") {
                return "/";
              }
              return null;
            }),
        GoRoute(
          path: '/forgot-password',
          builder: (context, state) => ForgotPasswordScreen(),
        ),
      ],
      // refreshListenable: AuthState(),
    );

    return MaterialApp.router(
      title: 'Lenovo Hiring',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Gotham",
        useMaterial3: true,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.red, // Change this to your desired color
          circularTrackColor: Colors.white, // Optional: Track color
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.red, // Set your desired cursor color here
        ),
      ),
      routerConfig: _router,
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
              Whyparticipate(),
              Rules(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
