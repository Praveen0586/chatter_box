import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseAuth.instance;

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String _selectedEmail = '';
  String _selectedPassword = '';
  bool isLogin = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _loginorsignup() async {
      final isValid = _formkey.currentState!.validate();

      if (!isValid) {
        return;
      }

      _formkey.currentState!.save();
      try {
        if (isLogin) {
          final userCredantials = await firebase.signInWithEmailAndPassword(
              email: _selectedEmail, password: _selectedPassword);
          print(userCredantials);
        } else {
          final userCredantials = await firebase.createUserWithEmailAndPassword(
              email: _selectedEmail, password: _selectedPassword);
          print(userCredantials);
        }
      } on FirebaseException catch (error) {
        if (error.code == 'invalid-email') {
          //
        }
        if (!context.mounted) {
          return;
        }
        print('show the error');
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication Failed'),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Image.network(
            'https://media.istockphoto.com/id/1314514463/vector/vector-illustration-futuristic-cyber-messenger-concept-smartphone-with-chat-bubbles-and.jpg?s=612x612&w=0&k=20&c=bhWlovsLHjRzawRcSLbSBakd35iAZM58Wy10KKswLVQ=',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              child: Center(
                  child: Card(
            color: const Color.fromARGB(55, 0, 0, 0),
            margin: const EdgeInsets.all(35),
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Chatter Box Login ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.mail_lock_outlined,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                label: Text(
                                  'Email Address ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                )),
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Enter a valid Email Address';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _selectedEmail = newValue!;
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            textCapitalization: TextCapitalization.none,
                            autocorrect: false,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.security_outlined,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                label: Text(
                                  'Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                )),
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.trim().length < 6) {
                                return 'Password must contain six Charectors';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _selectedPassword = newValue!;
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton.icon(
                              onPressed: _loginorsignup,
                              icon: Icon(isLogin
                                  ? Icons.lightbulb_outline
                                  : Icons.bubble_chart_outlined),
                              label: Text(isLogin ? 'LogIn' : 'SignIn')),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  isLogin = !isLogin;
                                  _formkey.currentState!.reset();
                                });
                              },
                              icon: Icon(isLogin
                                  ? Icons.bubble_chart_outlined
                                  : Icons.lightbulb_outline),
                              label: Text(isLogin
                                  ? 'Create a New Account'
                                  : 'Login with your Account'),
                              style: TextButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onPrimary))
                        ],
                      )),
                )
              ],
            )),
          )))
        ],
      ),
    );
  }
}
