import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:momogram/services/auth/auth_service.dart';
import 'package:momogram/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  void register() async {
    //auth service
    final authService = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        await authService.registerWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        log(e.toString());
      }
    } else {
      log("Password not match");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_emotions,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Welcome",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _confirmPasswordController,
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
              onPressed: register,
              child: const Text(
                "Register",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
