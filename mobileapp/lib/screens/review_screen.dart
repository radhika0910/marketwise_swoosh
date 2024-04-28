import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import HTTP package for API requests

class ReviewScreen extends StatelessWidget {
  TextEditingController feedbackController =
      TextEditingController(); // Controller for the feedback input

  Future<void> sendFeedback(BuildContext context) async {
    String feedback = feedbackController.text;
    if (feedback.isNotEmpty) {
      // Construct the API URL with the user ID (replace with actual user ID)
      String apiUrl =
          'http://localhost:8080/write-review/662d00c9ba95c6b405edce36';

      // Make a POST request to the API with the feedback
      var response =
          await http.post(Uri.parse(apiUrl), body: {'review': feedback});

      if (response.statusCode == 200) {
        // Feedback saved successfully
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text('Feedback submitted successfully!'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Error saving feedback
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(width: 8),
                Text('Error submitting feedback'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Show a message if feedback is empty
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter your feedback')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                hintText: 'Enter your feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Allow multiple lines for feedback
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => sendFeedback(context),
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
