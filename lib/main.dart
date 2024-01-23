import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stocks/firebase_options.dart';
import 'package:stocks/pages/daily_checks.dart';
import 'package:stocks/pages/financial_analysis.dart';
import 'package:stocks/pages/home_page.dart';
import 'package:stocks/pages/indian_indices.dart';
import 'package:stocks/pages/login_page.dart';
import 'package:stocks/pages/market_stocks.dart';
import 'package:stocks/pages/register_page.dart';
import 'package:stocks/pages/stock_graph.dart';
import 'package:stocks/utils/routes.dart';
import 'package:flutter/services.dart';
import 'package:stocks/utils/secure_storage_helper.dart';

secureStorageHelper _secureStorageHelper = secureStorageHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Abel',
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: true,
      title: "STOCKS",
      home: const AppLoader(),
      routes: {
        MyRoutes.registerRoute: (context) => const RegisterPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.indianRoute: (context) => const IndianIndices(),
        MyRoutes.finRoute: (context) => const FinancialAnalysis(),
        MyRoutes.marketRoute: (context) => const MarketStocks(),
        MyRoutes.graphRoute: (context) => const StocksGraph(),
        MyRoutes.checkRoute: (context) => const DailyChecks(),
      },
    );
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print("Firebase is initialized");
          return FutureBuilder(
            future: _checkAuthStatus(),
            builder: (context, authSnapshot) {
              if (authSnapshot.connectionState == ConnectionState.done) {
                String? authString = authSnapshot.data as String?;
                print(authString);
                if (authString == "home") {
                  return const HomePage();
                } else if (authString == "login") {
                  return const LoginPage();
                } else {
                  return const RegisterPage();
                }
              } else {
                return  LoadingScreen();
              }
            },
          );
        } else if (snapshot.hasError) {
          return  ErrorApp();
        } else {
          return  LoadingScreen();
        }
      },
    );
  }

  Future<void> _initializeApp() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: 'aDummyPassword', // Use a dummy password for checking existence, you won't actually create a user
      );

      // User creation successful, email doesn't exist
      await userCredential.user?.delete(); // Delete the dummy user

      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // User creation failed, email already exists
        return true;
      } else {
        // Handle other exceptions
        return false;
      }
    }
  }

  Future<String> _checkAuthStatus() async {
    String? token = await _secureStorageHelper.getAuthToken();
    DateTime? expiryTime = await _secureStorageHelper.getAuthTokenExpiry();
    if (token != null && expiryTime != null) {
      print(token);
      String email = _secureStorageHelper.extractEmailFromToken(token);
      bool isRegistered = await isEmailRegistered(email);
      // print(isRegistered);
      if (expiryTime.isAfter(DateTime.now()) && isRegistered) {
        return "home";
      } else {
        await _secureStorageHelper.deleteAuthToken();
        return "login";
      }
    } else {
      return "register";
    }
  }
}


class ErrorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text('Error initializing Firebase. Please check your internet connection.'),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
