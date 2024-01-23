import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stocks/firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stocks/pages/email_verification.dart';
import 'package:stocks/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  var userCredential;
  late final Future<FirebaseApp> _initialization;
  bool _isEmailEmpty = true;
  bool _isPasswordEmpty = true;
  bool _isButtonPressed = false;
  bool _isLoading = false;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _initialization = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
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
                                onChanged: (value) {
                                  setState(() {
                                    _isEmailEmpty = value.isEmpty;
                                  });
                                },
                                enableSuggestions: false,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  errorText: (_isButtonPressed && _isEmailEmpty)
                                      ? 'This field is required'
                                      : null,
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
                                onChanged: (value) {
                                  setState(() {
                                    _isPasswordEmpty = value.isEmpty;
                                  });
                                },
                                decoration: InputDecoration(
                                  errorText:
                                      (_isButtonPressed && _isPasswordEmpty)
                                          ? 'This field is required'
                                          : null,
                                  hintText: "Enter Your password here",
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            _isLoading
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: (_isEmailEmpty &&
                                            _isPasswordEmpty)
                                        ? null
                                        : () async {
                                            _isButtonPressed = true;
                                            final email = _email.text;
                                            final password = _password.text;
                                            try {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              userCredential = await FirebaseAuth
                                                  .instance
                                                  .createUserWithEmailAndPassword(
                                                      email: email,
                                                      password: password);
                                              print(userCredential);
                                              setState(() {
                                                _isLoading = false;
                                              });

                                              Fluttertoast.showToast(
                                                msg: "Sign Up successful",
                                                toastLength: Toast
                                                    .LENGTH_LONG, // Duration of the toast
                                                gravity: ToastGravity
                                                    .TOP, // Toast position
                                                backgroundColor: Color.fromARGB(
                                                    255,
                                                    11,
                                                    199,
                                                    39), // Background color of the toast
                                                textColor: Colors
                                                    .white, // Text color of the toast
                                              );
                                              await Future.delayed(
                                                  Duration(seconds: 2));
                                              if (userCredential.user != null) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            const EmailVerificationScreen()));
                                              }
                                              // Navigator.pushReplacement(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           LoginPage()),
                                              // );
                                            } on FirebaseAuthException catch (e) {
                                              setState(() {
                                                _isLoading = false;
                                              });
                                              print(e.code);
                                              if (e.code ==
                                                  'email-already-in-use') {
                                                Fluttertoast.showToast(
                                                  msg: "Invalid credentials",
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
                                                print(
                                                    "User with that email already exists");
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
                                                  'channel-error') {
                                                Fluttertoast.showToast(
                                                  msg: "Incomplete credentials",
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
                                              } else if (e.code ==
                                                  'weak-password') {
                                                Fluttertoast.showToast(
                                                  msg: "Password's too weak",
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
                                                print(
                                                    "The password is too weak");
                                              } else if (e.code ==
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
                                            }
                                          },
                                    child: Text("Register"),
                                  ),
                            TextButton(
                              onPressed: () {
                                // Navigate to the login page when the button is pressed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage()), // Replace LoginPage with the actual login page
                                );
                              },
                              child: Text(
                                "Already a user? Login",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 23, 23, 24), // Customize the color as needed
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
}
