import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/gen/assets.gen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    final tabStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: themData.colorScheme.onPrimary,
    );
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 32),
            child: Assets.img.background.logo.svg(width: 110),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: themData.colorScheme.primary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Login'.toUpperCase(), style: tabStyle),
                        Text('sign up'.toUpperCase(), style: tabStyle),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                        color: themData.colorScheme.surface,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(32),
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
                            style: themData.textTheme.headline4,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sign in with your account',
                            style: themData.textTheme.subtitle1!
                                .apply(fontSizeFactor: 0.8),
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            decoration:
                                InputDecoration(label: Text('User name')),
                          ),
                          const PasswordTextField(),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Login'.toUpperCase()),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width, 60)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Forgot your password?'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Reset here'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: Text(
                              'Or sign in with'.toUpperCase(),
                              style: const TextStyle(letterSpacing: 2),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.img.icons.google.image(width: 36),
                              const SizedBox(width: 24),
                              Assets.img.icons.facebook.image(width: 36),
                              const SizedBox(width: 24),
                              Assets.img.icons.twitter.image(width: 36),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: (() {
            setState(() {
              obscureText = !obscureText;
            });
          }),
          child: Text(
            (obscureText) ? 'show' : 'Hide',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
