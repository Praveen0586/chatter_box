import 'package:chatter_box/screens/authentication.dart';
import 'package:chatter_box/screens/loggedin_screen.dart';
import 'package:chatter_box/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chatter Box',
        theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 53, 199, 39),
          ),
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SplashScreen();
              }
              if (snapshot.hasData) {
                return const LoggedInScreen();
              }
              return const AuthenticationScreen();
            }));
  }
}
