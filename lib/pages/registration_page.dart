import 'package:carcompany/auth/auth_service.dart';
import 'package:carcompany/components/my_button.dart';
import 'package:carcompany/components/my_textfield.dart';
import 'package:carcompany/pages/login_pages.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  RegistrationPage({super.key, required this.onTap});

  // Make this async since signup is async
  void createAccount(BuildContext context) async {
    final _auth = AuthService();

    // Check if password matches confirm password
    if (_passwordController.text == _nameController.text) {
      try {
        await _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );

        // Show success dialog or navigate
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text(e.toString())),
        );
      }
    } else {
      // Passwords don't match -> tell user to fix
      showDialog(
        context: context,
        builder: (context) =>const  AlertDialog(content: Text("Passwords don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "User",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              MyTextfield(
                hintText: "Name",
                obscureText: false,
                controller: _nameController,
              ),
              const SizedBox(height: 15),
              MyTextfield(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 15),
              MyTextfield(
                hintText: "Password",
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 15),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      "Click here",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyButton(
                text: "Create Account",
                onTap: () => createAccount(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}