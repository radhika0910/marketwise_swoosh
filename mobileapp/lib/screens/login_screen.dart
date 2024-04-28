import 'package:flutter/material.dart';

import '../services/authentication_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'welcome_screen.dart'; // Import the welcome screen

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: usernameController,
              labelText: 'Username',
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              labelText: 'Password',
              isPassword: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                String username = usernameController.text;
                String password = passwordController.text;
                bool success =
                    await AuthenticationService().login(username, password);
                if (success) {
                  // Navigate to the welcome screen on successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                } else {
                  // Show error dialog for failed login
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Login Error'),
                        content: Text(
                            'Invalid username or password. Please try again.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
