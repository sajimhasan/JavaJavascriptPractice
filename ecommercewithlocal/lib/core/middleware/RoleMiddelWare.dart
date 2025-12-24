import 'package:ecommercewithlocal/core/controller/AuthController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RoleMiddleware extends GetMiddleware {
  final UserRole requiredRole;

  RoleMiddleware(this.requiredRole);

  @override
  RouteSettings? redirect(String? route) {
    final AuthController auth = Get.find<AuthController>();

    if (!auth.isLoggedIn.value) {
      return const RouteSettings(name: '/login');
    }

    if (auth.role.value.index < requiredRole.index) {
      return const RouteSettings(name: '/unauthorized');
    }

    return null; // allow access
  }
}