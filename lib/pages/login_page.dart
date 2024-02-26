import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stocks/firebase_options.dart';
import 'package:stocks/pages/email_verification.dart';
import 'package:stocks/pages/home_page.dart';
import 'package:stocks/pages/register_page.dart';
import 'package:stocks/utils/secure_storage_helper.dart';
import 'package:stocks/utils/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  AuthService _authService = AuthService();
  late final Future<FirebaseApp> _initialization;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _initialization = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    getConnectivity();
    super.initState();
  }

    late StreamSubscription subscription;
  var isDeviceConnected = false;
  var isAlertSet = false;


  getConnectivity() => 
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async{ 
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && !isAlertSet) {
        showDialogBox();
        setState(() {
          isAlertSet = true;
        });
      }
    },);

  @override
  void dispose() {
    _email.dispose();
    subscription.cancel();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double imageSize =
                        constraints.maxWidth > 600 ? 300.0 : 150.0;
                    double textFieldWidth = constraints.maxWidth > 600
                        ? constraints.maxWidth / 2
                        : constraints.maxWidth;

                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ConstrainedBox(
                                constraints: BoxConstraints(minHeight: 100)),
                            Image(
                              image: AssetImage("assets/images/register.png"),
                              height: imageSize,
                              width: imageSize,
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: textFieldWidth,
                              child: TextField(
                                controller: _email,
                                enableSuggestions: false,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: "Enter Your email here",
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: textFieldWidth,
                              child: TextField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: _password,
                                decoration: InputDecoration(
                                  hintText: "Enter Your password here",
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async {
                                final email = _email.text;
                                final password = _password.text;
                                try {

                                  final userCredential = await FirebaseAuth
                                      .instance
                                      .signInWithEmailAndPassword(
                                          email: email, password: password);
                                  print(userCredential);
                                  if (userCredential.user?.emailVerified==true){
                                    await _authService.SaveToken(email, password);
                                  print("saved token");
                                  Fluttertoast.showToast(
                                    msg: "Login successful",
                                    toastLength: Toast
                                        .LENGTH_LONG, // Duration of the toast
                                    gravity: ToastGravity.TOP, // Toast position
                                    backgroundColor: Color.fromARGB(
                                        255,
                                        11,
                                        199,
                                        39), // Background color of the toast
                                    textColor:
                                        Colors.white, // Text color of the toast
                                  );
                                  await Future.delayed(Duration(seconds: 2));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomePage()), // Replace LoginPage with the actual login page
                                  );
                                  }
                                  else{
                                    Fluttertoast.showToast(
                                    msg: "Please verify your email before logging in",
                                    toastLength: Toast
                                        .LENGTH_LONG, // Duration of the toast
                                    gravity: ToastGravity.TOP, // Toast position
                                    backgroundColor: Color.fromARGB(
                                        255,
                                        11,
                                        199,
                                        39), // Background color of the toast
                                    textColor:
                                        Colors.white, // Text color of the toast
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EmailVerificationScreen()), // Replace LoginPage with the actual login page
                                  );
                                  }
                                  
                                  
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);
                                  if (e.code == "invalid-credential"){
                                    Fluttertoast.showToast(
                                                  msg: "Invalid credential",
                                                  toastLength: Toast
                                                      .LENGTH_LONG, // Duration of the toast
                                                  gravity: ToastGravity
                                                      .TOP, // Toast position
                                                  backgroundColor: Color.fromARGB(
                                                      255,
                                                      199,
                                                      36,
                                                      11), // Background color of the toast
                                                  textColor: Colors
                                                      .white, // Text color of the toast
                                                );
                                  }
                                  else if (e.code == 'network-request-failed'){
                                                Fluttertoast.showToast(
                                                  msg: "No internet connection",
                                                  toastLength: Toast
                                                      .LENGTH_LONG, // Duration of the toast
                                                  gravity: ToastGravity
                                                      .TOP, // Toast position
                                                  backgroundColor: Color.fromARGB(
                                                      255,
                                                      199,
                                                      36,
                                                      11), // Background color of the toast
                                                  textColor: Colors
                                                      .white, // Text color of the toast
                                                );
                                              }
                                  else if (e.code ==
                                                  'invalid-email') {
                                                print("Invalid email entered");
                                                Fluttertoast.showToast(
                                                  msg: "Invalid email",
                                                  toastLength: Toast
                                                      .LENGTH_LONG, // Duration of the toast
                                                  gravity: ToastGravity
                                                      .TOP, // Toast position
                                                  backgroundColor: Color.fromARGB(
                                                      255,
                                                      199,
                                                      36,
                                                      11), // Background color of the toast
                                                  textColor: Colors
                                                      .white, // Text color of the toast
                                                );
                                              }
                                  else if (e.code ==
                                                  'channel-error') {
                                                Fluttertoast.showToast(
                                                  msg: "Both fields are required",
                                                  toastLength: Toast
                                                      .LENGTH_LONG, // Duration of the toast
                                                  gravity: ToastGravity
                                                      .TOP, // Toast position
                                                  backgroundColor: Color.fromARGB(
                                                      255,
                                                      199,
                                                      36,
                                                      11), // Background color of the toast
                                                  textColor: Colors
                                                      .white, // Text color of the toast
                                                );
                                                  }
                                  //print(e.runtimeType);
                                }
                              },
                              child: Text("Login"),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to the login page when the button is pressed
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterPage()), // Replace LoginPage with the actual login page
                                );
                              },
                              child: Text(
                                "A new user? Register",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 23, 23,
                                      24), // Customize the color as needed
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );

              default:
                return Center(
                  child: Text(
                      "Unhandled ConnectionState: ${snapshot.connectionState}"),
                );
            }
          },
        ),
      ),
    );
  }
  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
