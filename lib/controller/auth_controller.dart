import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/screens/home_page.dart';
import 'package:firebase_series/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuthServices _services = FirebaseAuthServices();

  ///is Loading
  RxBool isLoading = false.obs;

  //_obscurePassword
  RxBool obscurePassword = true.obs;
  Future<void> singUp(String email, String password) async {
    try {
      isLoading(true);
      User? user = await _services.singUp(email, password);

      if (user != null) {
        // ✅ Success Popup
        Get.dialog(
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Success!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Account created successfully 🎉",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.offAll(HomePage());
                      },
                      child: Text("Continue"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Signup failed");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      User? user = await _services.login(email, password);
      if (user != null) {
        Get.dialog(
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Success!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Logged in successfully 🎉",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.offAll(HomePage());
                      },
                      child: Text("Continue"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Login failed");
    } finally {
      isLoading.value = false;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _services.logout();
    Get.snackbar("Logout", "User logged out");
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }
}
