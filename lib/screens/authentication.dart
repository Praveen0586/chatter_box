import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecoration(
                            label: Text(
                          'Email Addreass ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        )),
                      ),
                      TextFormField(
                        obscureText: true,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecoration(
                            label: Text(
                          'Password',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        )),
                      )
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
