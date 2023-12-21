import 'dart:io';
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

class AppLoader extends StatefulWidget {
 const AppLoader({Key? key}) : super(key: key);

 @override
 State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
 final ValueNotifier<bool> _refresh = ValueNotifier<bool>(false);

 Future<bool> checkInternetConnection() async {
   try {
     final result = await InternetAddress.lookup('google.com');
     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
       return true;
     }
   } on SocketException catch (_) {
     return false;
   }
   return false;
 }

 void refresh() {
   _refresh.value = !_refresh.value;
 }

 @override
 Widget build(BuildContext context) {
   return ValueListenableBuilder<bool>(
     valueListenable: _refresh,
     builder: (context, _, __) {
       return FutureBuilder(
         future: checkInternetConnection(),
         builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.done) {
             if (snapshot.hasData && snapshot.data == true) {
               return FutureBuilder(
                future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print("Firebase is initialized");
                    return const RegisterPage();
                  } else if (snapshot.hasError) {
                    return ErrorApp();
                  } else {
                    return LoadingScreen();
                  }
                },
               );
             } else {
               return NoInternetConnectionPage(
                onTryAgain: refresh,
               );
             }
           } else {
             return LoadingScreen();
           }
         },
       );
     },
   );
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

class NoInternetConnectionPage extends StatelessWidget {
 final VoidCallback onTryAgain;

 const NoInternetConnectionPage({Key? key, required this.onTryAgain})
     : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text('No internet connection. Please check and try again.'),
           ElevatedButton(
             child: Text('Refresh'),
             onPressed: onTryAgain,
           ),
         ],
       ),
     ),
   );
 }
}
