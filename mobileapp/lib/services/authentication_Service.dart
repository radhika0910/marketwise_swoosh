import 'dart:convert'; // Import the dart:convert library

import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<bool> login(String username, String password) async {
    final String apiUrl = 'http://127.0.0.1:8080/login';

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'Login_ID': username,
        'Password': password,
      });

      if (response.statusCode == 200) {
        // Login successful
        final jsonResponse =
            jsonDecode(response.body); // Parse the JSON response
        print(
            'Login successful: ${jsonEncode(jsonResponse)}'); // Print formatted JSON
        // Handle navigation or other actions after successful login
        return true;
      } else if (response.statusCode == 401) {
        // Invalid credentials
        print('Invalid credentials');
        return false;
      } else {
        // Handle other status codes or errors
        print('Login failed: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle network or server errors
      print('Error: $error');
      return false;
    }
  }
}
