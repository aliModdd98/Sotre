import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController()); // Bind the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                Text(
                  "Hello Again!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Fill Your Details Or Continue With \n Social Media",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Email Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: loginController.emailController,
                  decoration: InputDecoration(
                    hintText: 'xyz@gmail.com',
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {
                        // toggle password visibility
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Call the password recovery function
                    },
                    child: Text(
                      'Recovery Password',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Obx(() {
                  return ElevatedButton(
                    onPressed: () {
                      loginController.loginWithFcm(); // Call the login method
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: loginController.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or"),
                    ),
                    Expanded(
                      child: Divider(thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Call the Google sign-in function
                  },
                  icon: Image.asset('assets/icons/google_icon.png', height: 24), // Ensure you have the icon in the assets
                  label: Text('Sign In With Google'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User? "),
                    TextButton(
                      onPressed: () {
                        // Navigate to the Create Account page
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
