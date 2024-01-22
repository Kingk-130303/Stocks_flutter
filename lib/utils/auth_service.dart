import "package:stocks/utils/secure_storage_helper.dart";
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
    final FirebaseAuth _auth = FirebaseAuth.instance;

  final secureStorageHelper _secureStorageHelper = secureStorageHelper();

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return null;
    }
  } 

  Future<void> SaveToken(String Useremail, String Password) async{
    String token = Useremail + ":" + Password;
    DateTime expiryTime = DateTime.now().add(Duration(days: 70));
    
    await _secureStorageHelper.saveAuthToken(token, expiryTime);

  }

  Future<void> logoutUser() async {
    
    await _secureStorageHelper.deleteAuthToken();
  }

}