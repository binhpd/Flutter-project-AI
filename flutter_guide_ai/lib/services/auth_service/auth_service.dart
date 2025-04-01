abstract class AuthService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearAuth();
  Future<bool> isAuthenticated();
} 