import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const String baseUrl =
      "https://e-commerce-back-end-1-juw4.onrender.com";

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  late final Dio dio;

  AuthService() {
    _initDio();
  }

  /// ================= INIT DIO =================
  void _initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add token to all requests except login/registration
          if (!options.path.contains('/login') &&
              !options.path.contains('/registration')) {
            final token = await getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await logout();
          }
          handler.next(error);
        },
      ),
    );
  }

  /// ================= LOGIN =================
  Future<String?> login(String username, String password) async {
    try {
      print("DEBUG: Starting login with username: $username");
      final response = await dio.post(
        '/api/auth/v4/login',
        data: {'username': username, 'password': password},
        options: Options(
          responseType: ResponseType.plain, // <-- CHANGE: treat backend token as plain string
        ),
      );

      print("DEBUG: Login response status: ${response.statusCode}");
      print("DEBUG: Login response headers: ${response.headers}");
      print("DEBUG: Login response data type: ${response.data.runtimeType}");
      print("DEBUG: Login response data length: ${response.data.toString().length}");
      print("DEBUG: Login response body: ${response.data}");

      if (response.statusCode == 200) {
        final token = response.data.toString().trim(); // <-- CHANGE: always treat as string
        print("DEBUG: Token extracted and saved successfully");
        await _storage.write(key: 'token', value: token);
        return token;
      }
      print("DEBUG: Status code not 200, returning null");
      return null;
    } on DioException catch (e) {
      print("ERROR: DioException - ${e.type}");
      print("ERROR: Message - ${e.message}");
      print("ERROR: Response status - ${e.response?.statusCode}");
      print("ERROR: Response body - ${e.response?.data}");
      rethrow;
    } catch (e) {
      print("ERROR: Login failed with exception: $e");
      print("ERROR: Exception type: ${e.runtimeType}");
      rethrow;
    }
  }

  /// ================= REGISTER =================
  Future<bool> register({
    required String fullName,
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      '/api/auth/v4/registration',
      data: {
        "fullName": fullName,
        "username": username,
        "password": password,
      },
    );

    return response.statusCode == 200 || response.statusCode == 201;
  }

  /// ================= TOKEN =================
  Future<String?> getToken() async {
    return await _storage.read(key: 'token'); // <-- Make sure key matches login
  }

  /// ================= LOGOUT =================
  Future<void> logout() async {
    await _storage.delete(key: 'token');
  }
}