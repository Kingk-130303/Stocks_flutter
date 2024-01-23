import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class secureStorageHelper{
  final FlutterSecureStorage _storage =  FlutterSecureStorage();
  Future<void> saveAuthToken(String token, DateTime expiryTime) async{
    await _storage.write(key: 'authToken', value: token);
    await _storage.write(key: 'authTokenExpiry',value: expiryTime.millisecondsSinceEpoch.toString());
  }
  Future<String?> getAuthToken() async{
    return await _storage.read(key: 'authToken');
  }
  Future<DateTime?> getAuthTokenExpiry() async{
    String? expiryTime = await _storage.read(key: 'authTokenExpiry');
    return expiryTime != null ? DateTime.fromMillisecondsSinceEpoch(int.parse(expiryTime)) : null;

  }
  Future<void> deleteAuthToken() async{
    await _storage.delete(key: 'authToken');
    await _storage.delete(key: 'authTokenExpiry');
  }
  String extractEmailFromToken(String token) {
  // Split the token string using ':' as the delimiter
  List<String> tokenParts = token.split(':');

  // The first part of the token should be the email
  if (tokenParts.length > 0) {
    return tokenParts[0];
  } else {
    // Handle the case where the token format is incorrect
    return ''; // or throw an exception, depending on your error handling strategy
  }
}

}