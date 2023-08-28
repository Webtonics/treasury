import 'package:flutter/material.dart';
import 'package:treasury/screens/authentication/forgot_password.dart';
import 'package:treasury/screens/authentication/login.dart';
import 'package:treasury/screens/authentication/signup.dart';
import 'package:treasury/screens/authentication/verify_email.dart';
import 'package:treasury/screens/book.dart';
import 'package:treasury/screens/help.dart';
import 'package:treasury/screens/home.dart';
import 'package:treasury/screens/settings.dart';
import 'package:treasury/services/auth/auth_service.dart';
// import 'package:treasury/services/auth/auth_user.dart';

import 'constants/routes/route.dart/routes_link.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Treasury',
      theme: ThemeData(
          // iconTheme: const IconThemeData(color: Colors.black),
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.black))),
          textTheme: const TextTheme(
              titleMedium: TextStyle(fontWeight: FontWeight.w700),
              bodyLarge: TextStyle(fontWeight: FontWeight.w600),
              bodyMedium: TextStyle(fontWeight: FontWeight.bold),
              bodySmall: TextStyle(fontWeight: FontWeight.w500)),
          // primaryColor: Colors.blue[900],
          // primarySwatch: Color.fromARGB(255, 15, 67, 146),
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue[900]),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]))),
      routes: {
        '/': (context) => const MyAppRoute(),
        loginscreen: (context) => const LoginPage(),
        homeScreen: (context) => const HomeScreen(),
        signupScreen: (context) => const RegisterPage(),
        verifyScreen: (context) => const VerifyPasswordPage(),
        // bookScreen: (context) => const BookView(),
        helpScreen: (context) => const HelpScreen(),
        settingsScreen: (context) => const SettingView(),
        forgotPasswordScreen: (context) => const ForgotPasswordPage(),
      },
      initialRoute: '/',
      // home: const LoginPage(),
    );
  }
}

class MyAppRoute extends StatelessWidget {
  const MyAppRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user == null) {
              return const LoginPage();
            } else {
              return const Route();
            }

          default:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        }
      },
    );
  }
}

class Route extends StatefulWidget {
  const Route({super.key});

  @override
  State<Route> createState() => _RouteState();
}

class _RouteState extends State<Route> {
  int currentTab = 0;

  List<Widget> pages = [
    // TestCloud(),
    const HomeScreen(),
    const HelpScreen(),
    const SettingView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor: Colors.blue[900],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        currentIndex: currentTab,
        items: [
          //test
          // BottomNavigationBarItem(
          //     icon: const Icon(Icons.book),
          //     label: "Cashbook",
          //     activeIcon: Icon(
          //       Icons.book,
          //       color: Colors.blue[900],
          //     )),
          //home
          BottomNavigationBarItem(
              icon: const Icon(Icons.book),
              label: "Cashbook",
              activeIcon: Icon(
                Icons.book,
                color: Colors.blue[900],
              )),
          // body
          // BottomNavigationBarItem(
          //     icon: const Icon(Icons.bookmark_add_outlined),
          //     label: "Book",
          //     activeIcon: Icon(
          //       Icons.bookmark_add_outlined,
          //       color: Colors.blue[900],
          //     )),
          //help
          BottomNavigationBarItem(
              icon: const Icon(Icons.help_outline_outlined),
              label: "Help",
              activeIcon: Icon(
                Icons.help_outline_outlined,
                color: Colors.blue[900],
              )),
          //settings
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: "Settings",
              activeIcon: Icon(
                Icons.settings,
                color: Colors.blue[900],
              )),
        ],
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
      ),
    );
  }
}
