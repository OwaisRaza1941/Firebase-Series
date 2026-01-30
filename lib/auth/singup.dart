import 'package:firebase_series/auth/login.dart';
import 'package:firebase_series/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 20.0, left: 10, right: 10),
                child: Column(
                  children: [
                     Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    inputFields(hintText: "Email", controller: emailCtrl),
                    const SizedBox(height: 15),
                    inputFields(
                      hintText: "Create Password",
                      controller: passwordCtrl,
                    ),
                    const SizedBox(height: 20),

                    // ✅ Signup Button with loading
                    Obx(() {
                      return controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await controller.singUp(
                                    emailCtrl.text.trim(),
                                    passwordCtrl.text.trim(),
                                  );
                                  if (controller.isLoading.value == false) {
                                    Get.to(() => const LoginPage());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 32, 92, 222),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text('Sign Up'),
                              ),
                            );
                    }),

                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an Account? '),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const LoginPage());
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Color.fromARGB(255, 32, 92, 222),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 32, 92, 222),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),
                    Row(
                      children: const [
                        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                      ],
                    ),

                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ),
                          backgroundColor: const Color.fromARGB(255, 16, 51, 126),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          // TODO: Add Facebook Login functionality
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.facebook, size: 25),
                            ),
                            Center(child: Text('Login with Facebook')),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Add Google Sign-In functionality
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 24,
                            width: 24,
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                "Sign in with Google",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Fixed typo here: inputFields
  TextField inputFields({
    required String hintText,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
