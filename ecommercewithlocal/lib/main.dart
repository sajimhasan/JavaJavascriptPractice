import 'package:ecommercewithlocal/core/controller/AuthController.dart';
import 'package:ecommercewithlocal/core/routes/PageRoutes.dart';
import 'package:ecommercewithlocal/modules/admin/HomePage.dart';
import 'package:ecommercewithlocal/modules/auth/LoginPage.dart';
import 'package:ecommercewithlocal/modules/seller/Homepage.dart';
import 'package:ecommercewithlocal/modules/users/UserNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authController = Get.put(AuthController(), permanent: true);

  // <-- CHANGE: await checkLoginStatus before running app
  await authController.checkLoginStatus();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    String initialRoute;

    if (authController.isLoggedIn.value) {
      switch (authController.role.value) {
        case UserRole.admin:
          initialRoute = Pageroutes.admin;
          break;
        case UserRole.seller:
          initialRoute = Pageroutes.sellerHomePage;
          break;
        case UserRole.user:
          initialRoute = Pageroutes.users;
          break;
        default:
          initialRoute = Pageroutes.login;
      }
    } else {
      initialRoute = Pageroutes.login;
    }

    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: Pageroutes.login, page: () => LoginPage()),
        GetPage(name: Pageroutes.users, page: () => Navbar()),
        GetPage(name: Pageroutes.admin, page: () => AdminHomepage()),
        GetPage(name: Pageroutes.sellerHomePage, page: () => SellerHomepage()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}