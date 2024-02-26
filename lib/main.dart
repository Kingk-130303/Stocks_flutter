import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
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
import 'package:stocks/utils/secure_storage_helper.dart';

secureStorageHelper _secureStorageHelper = secureStorageHelper();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runWithInternetCheck();
}

void runWithInternetCheck() async {
  bool isConnected = await InternetConnectionChecker().hasConnection;
  if (!isConnected) {
    print("No internet connection");
    runApp(ErrorApp(message: ' Please check your internet connection. '));
    return;
  }
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
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
      ),
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
                return LoadingScreen();
              }
            },
          );
        } else if (snapshot.hasError) {
          return ErrorApp(message: 'Error initializing Firebase.');
        } else {
          return LoadingScreen();
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
      print(isRegistered);
      if (expiryTime.isAfter(DateTime.now()) && isRegistered) {
        return "home";
      } else {
        print("Hello");
        await _secureStorageHelper.deleteAuthToken();
        return "login";
      }
    } else {
      return "register";
    }
  }
}

class ErrorApp extends StatelessWidget {
  final String message;

  const ErrorApp({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        title: 'Internet Connection Error',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Internet Connection Error'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                Icons.error,
                size: 100,
                color: Colors.red, // Customize error icon color
              ),
              SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red, // Customize error message color
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Retry the app only if internet connection is detected
                  runWithInternetCheck();
                },
                child: Text(
                  'Retry',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  //primary: Colors.red, // Customize button color
                  //onPrimary: Colors.white, // Customize text color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading',
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
