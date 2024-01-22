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
}