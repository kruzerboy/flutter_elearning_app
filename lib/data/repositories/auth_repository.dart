import 'package:shared_preferences/shared_preferences.dart';
import '../api/auth_api_service.dart';
import '../models/auth_response.dart';
import '../models/user_model.dart';

class AuthRepository {
  final AuthApiService _authApiService;

  AuthRepository(this._authApiService);

  // Register
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await _authApiService.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    await _saveTokens(response.accessToken, response.refreshToken);
    await _saveUser(response.user);
    return response;
  }

  // Login
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _authApiService.login(
      email: email,
      password: password,
    );
    await _saveTokens(response.accessToken, response.refreshToken);
    await _saveUser(response.user);
    return response;
  }

  // Send OTP
  Future<void> sendOtp({required String email}) async {
    await _authApiService.sendOtp(email: email);
  }

  // Verify OTP
  Future<AuthResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _authApiService.verifyOtp(
      email: email,
      otp: otp,
    );
    await _saveTokens(response.accessToken, response.refreshToken);
    await _saveUser(response.user);
    return response;
  }

  // Logout
  Future<void> logout() async {
    await _authApiService.logout();
    await _clearLocalData();
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    return token != null && token.isNotEmpty;
  }

  // Get current user
  Future<UserModel?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');
    if (userData != null) {
      return UserModel.fromJson({'email': userData}); // Simplified
    }
    return null;
  }

  // Private helper methods
  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  Future<void> _saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', user.id);
    await prefs.setString('user_email', user.email);
    if (user.firstName != null) {
      await prefs.setString('user_first_name', user.firstName!);
    }
    if (user.lastName != null) {
      await prefs.setString('user_last_name', user.lastName!);
    }
  }

  Future<void> _clearLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
    await prefs.remove('user_id');
    await prefs.remove('user_email');
    await prefs.remove('user_first_name');
    await prefs.remove('user_last_name');
  }
}
