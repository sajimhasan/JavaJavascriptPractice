import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controller/AuthController.dart';
import '../users/HomePage.dart';

class UserRegistrationPage extends StatefulWidget {
  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final AuthController controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  final fullName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final contact = TextEditingController();
  final country = TextEditingController();
  final city = TextEditingController();
  final subDistrict = TextEditingController();
  final union = TextEditingController();
  final village = TextEditingController();
  final postCode = TextEditingController();
  final moreDetails = TextEditingController();

  Future<void> register() async {
    if (!_formKey.currentState!.validate()) return;

    final ok = await controller.registerUser(
      fullName: fullName.text.trim(),
      userName: username.text.trim(),
      password: password.text.trim(),
     
    );

    if (ok) {
      Get.snackbar("Success", "Registration completed");
      Get.off(() => Homepage());
    } else {
      Get.snackbar("Error", "Registration failed");
      print(controller.isLoading.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Registration")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field(fullName, "Full Name"),
              _field(username, "Username"),
              _field(password, "Password", obscure: true),
              const SizedBox(height: 20),

              Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: register,
                      child: const Text("Register"),
                    )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController c,
    String label, {
    bool obscure = false,
    bool number = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        obscureText: obscure,
        maxLines: maxLines,
        keyboardType: number ? TextInputType.number : TextInputType.text,
        validator: (v) => v == null || v.isEmpty ? "Required" : null,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}