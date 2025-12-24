// // ui/SplashPage.dart
// import 'package:ecommercewithlocal/core/services/AuthService.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SplashPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final auth = Get.find<AuthController>();

//     Future.delayed(const Duration(seconds: 1), () {
//       if (auth.isLoggedIn.value) {
//         auth.role.value == 'ROLE_ADMIN'
//             ? Get.offAllNamed('/admin')
//             : Get.offAllNamed('/user');
//       } else {
//         Get.offAllNamed('/login');
//       }
//     });

//     return const Scaffold(
//       body: Center(child: CircularProgressIndicator()),
//     );
//   }
// }