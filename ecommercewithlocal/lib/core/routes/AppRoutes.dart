// // middleware/role_middleware.dart
// import 'package:ecommercewithlocal/core/services/AuthService.dart';
// import 'package:get/get.dart';

// class RoleMiddleware extends GetMiddleware {
//   final String requiredRole;

//   RoleMiddleware(this.requiredRole);

//   @override
//   RouteSettings? redirect(String? route) {
//     final auth = Get.find<AuthController>();

//     if (!auth.isLoggedIn.value) {
//       return const RouteSettings(name: '/login');
//     }

//     if (auth.role.value != requiredRole) {
//       return const RouteSettings(name: '/login');
//     }

//     return null;
//   }
// }