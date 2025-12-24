import 'dart:convert';
import 'package:ecommercewithlocal/core/services/AuthService.dart';
import 'package:get/get.dart';

enum UserRole { admin, user, seller, guest }

class AuthController extends GetxController {
  final AuthService apiService = AuthService();

  final RxBool isLoggedIn = false.obs;
  final RxBool isLoading = false.obs;
  final Rx<UserRole> role = UserRole.guest.obs;

  @override
  void onInit() {
    super.onInit();
    // Removed async call from here; handled in main() for proper initial route
  }

  /// ================= AUTO LOGIN =================
  Future<void> checkLoginStatus() async {
    final token = await apiService.getToken();
    if (token != null && token.isNotEmpty) {
      isLoggedIn.value = true;
      role.value = _decodeRole(token); // <-- CHANGE: safe decode
    }
  }

  /// ================= LOGIN =================
  Future<bool> login(String username, String password) async {
    try {
      isLoading.value = true;

      final token = await apiService.login(username, password);

      if (token != null) {
        isLoggedIn.value = true;
        role.value = _decodeRole(token); // <-- CHANGE: safe decode
        Get.offAllNamed('/users'); // Changed from '/home' to '/users'
        return true;
      }

      Get.snackbar('Login Failed', 'Invalid credentials');
      return false;
    } catch (e) {
      Get.snackbar('Login Error', e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// ================= REGISTER =================
  Future<bool> registerUser({
    required String fullName,
    required String userName,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final success = await apiService.register(
        fullName: fullName,
        username: userName,
        password: password,
      );

      if (success) {
        Get.back();
        Get.snackbar('Success', 'Registration completed');
      }

      return success;
    } catch (e) {
      Get.snackbar('Registration Error', e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// ================= LOGOUT =================
  Future<void> logout() async {
    await apiService.logout();
    isLoggedIn.value = false;
    role.value = UserRole.guest;
    Get.offAllNamed('/login');
  }

  /// ================= ROLE DECODER =================
  UserRole _decodeRole(String token) {
    try {
      final payload = jsonDecode(
        utf8.decode(
          base64Url.decode(base64Url.normalize(token.split('.')[1])),
        ),
      );

      // <-- CHANGE: safe decoding like working project
      if (payload.containsKey('roles')) {
        final roles = payload['roles'];
        if (roles is List && roles.isNotEmpty) {
          final roleStr = roles[0];
          switch (roleStr) {
            case 'ROLE_ADMIN':
              return UserRole.admin;
            case 'ROLE_SELLER':
              return UserRole.seller;
            case 'ROLE_USER':
              return UserRole.user;
          }
        } else if (roles is String) {
          final roleStr = roles;
          switch (roleStr) {
            case 'ROLE_ADMIN':
              return UserRole.admin;
            case 'ROLE_SELLER':
              return UserRole.seller;
            case 'ROLE_USER':
              return UserRole.user;
          }
        }
      }
      return UserRole.guest;
    } catch (_) {
      return UserRole.guest;
    }
  }
}