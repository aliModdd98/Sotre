import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  // Observable for loading state
  var isLoading = false.obs;

  // To store the FCM token
  String fcmToken = '';

  // Text editing controllers for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to fetch FCM token from the API
  Future<void> fetchFcmToken() async {
    try {
      var response = await http.get(
        Uri.parse('https://task.focal-x.com/api/fcm'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // Assuming the FCM token is in the 'fcm_token' key of the data
        fcmToken = data['data'][0]['fcm_token'];
        print('FCM Token fetched: $fcmToken');
      } else {
        Get.snackbar("Error", "Failed to fetch FCM token: ${response.body}");
      }
    } catch (error) {
      Get.snackbar("Error", "An error occurred: $error");
    }
  }

  // Method to log in using the fetched FCM token
  Future<void> login(String email, String password) async {
    if (fcmToken.isEmpty) {
      Get.snackbar("Error", "FCM token is missing, please try again.");
      return;
    }

    try {
      isLoading.value = true; // Start loading

      var response = await http.post(
        Uri.parse('https://task.focal-x.com/api/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': email,
          'password': password,
          'fcm_token': fcmToken, // Use the fetched FCM token here
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print('Login successful: ${data}');
        Get.snackbar("Success", "Login successful");
        // Handle the response, e.g., store access token, navigate, etc.
      } else {
        Get.snackbar("Error", "Login failed: ${response.body}");
      }
    } catch (error) {
      Get.snackbar("Error", "An error occurred: $error");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  // Method to combine fetching FCM token and logging in
  Future<void> loginWithFcm() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter both email and password.");
      return;
    }

    await fetchFcmToken(); // Fetch FCM token first
    await login(email, password); // Then proceed with login
  }
}
