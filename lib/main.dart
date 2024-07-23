import 'package:chatter_box/screens/authentication.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Chatter Box',
        theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 53, 199, 39),
          ),
        ),
        home: const AuthenticationScreen());
  }
}
