import 'dart:convert';
import 'package:ecommercewithlocal/core/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthController auth = Get.find<AuthController>();

  // Reactive variables
  final RxBool loading = true.obs;
  final RxMap<String, dynamic> userData = <String, dynamic>{}.obs;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  // ===============================
  // FETCH USER PROFILE
  // ===============================
  Future<void> _loadProfile() async {
    final token = await auth.apiService.getToken(); // get token from AuthService

    if (token == null || token.isEmpty) {
      loading.value = false;
      // Redirect to login if no token
      Get.offAllNamed('/login');
      return;
    }

    try {
      // Check if token is expired
      if (JwtDecoder.isExpired(token)) {
        loading.value = false;
        Get.offAllNamed('/login');
        return;
      }

      final decoded = JwtDecoder.decode(token);
      print("DEBUG: Decoded token: $decoded");
      print("DEBUG: Token keys: ${decoded.keys.toList()}");

      // Try different possible field names for userId
      final userId = decoded["userId"] ?? 
                     decoded["id"] ?? 
                     decoded["sub"] ?? 
                     decoded["user_id"];

      print("DEBUG: userId extracted: $userId");

      if (userId == null) {
        print("ERROR: Could not extract userId from token. Token keys: ${decoded.keys.toList()}");
        
        // Try fetching from /list endpoint instead
        print("DEBUG: Trying /list endpoint instead...");
        final meUrl = Uri.parse(
            "https://e-commerce-back-end-1-juw4.onrender.com/api/auth/v4/list");
        
        final meRes = await http.get(meUrl, headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        });

        print("DEBUG: /list endpoint response status: ${meRes.statusCode}");
        print("DEBUG: /list endpoint response body: ${meRes.body}");

        if (meRes.statusCode == 200) {
          userData.value = jsonDecode(meRes.body);
          loading.value = false;
          return;
        }

        Get.snackbar('Error', 'Could not extract user ID from token');
        loading.value = false;
        return;
      }

      final url = Uri.parse(
          "https://e-commerce-back-end-1-juw4.onrender.com/api/auth/v4/users/$userId");
      
      print("DEBUG: Fetching profile from: $url");

      final res = await http.get(url, headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      });

      print("DEBUG: API Response status: ${res.statusCode}");
      print("DEBUG: API Response body: ${res.body}");

      if (res.statusCode == 200) {
        userData.value = jsonDecode(res.body); // reactive map
        print("DEBUG: User data loaded successfully");
      } else if (res.statusCode == 401) {
        // Token invalid or expired
        print("ERROR: 401 Unauthorized");
        await auth.logout();
        Get.offAllNamed('/login');
      } else if (res.statusCode == 403) {
        // Forbidden - likely a security/role issue
        print("ERROR: 403 Forbidden - Access denied");
        print("Response body: ${res.body}");
        Get.snackbar('Access Denied', 'You do not have permission to access this resource (403)');
      } else {
        print("ERROR: Fetch profile failed: ${res.statusCode} - ${res.body}");
        Get.snackbar('Error', 'Failed to fetch profile: ${res.statusCode}');
      }
    } catch (e) {
      print("Error fetching user profile: $e");
      Get.offAllNamed('/login');
    } finally {
      loading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Obx(() {
        if (loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userData.isEmpty) {
          return const Center(child: Text("No user data found"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // PROFILE CARD
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.person,
                              size: 80, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData["username"] ?? "Unknown User",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            userData["fullName"] ?? "No full name",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // LOGOUT BUTTON
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: () async {
                  await auth.logout();
                  Get.offAllNamed('/login');
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}