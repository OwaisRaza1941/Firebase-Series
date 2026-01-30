import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/services/firebase_auth_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuthServices _services = FirebaseAuthServices();

  ///is Loading
  RxBool isLoading = false.obs;

  Future<void> singUp(String email, String password) async {
    try {
      isLoading(true);
      User? user = await _services.singUp(email, password);
      if (user != null) {
        Get.snackbar("Success", "Account created successfully");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      User? user = await _services.login(email, password);
      if (user != null) {
        Get.snackbar("Success", "Login successful");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _services.logout();
    Get.snackbar("Logout", "User logged out");
  }
}
