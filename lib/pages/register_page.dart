import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stocks/firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                                  errorText: (_isButtonPressed && _isEmailEmpty) ? 'This field is required' : null,
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
                                errorText: (_isButtonPressed && _isPasswordEmpty) ? 'This field is required' : null,
                                  hintText: "Enter Your password here",
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: (_isEmailEmpty && _isPasswordEmpty) ? null : () async {
                                _isButtonPressed = true;
                                final email = _email.text;
                                final password = _password.text;
                                try {
                                  userCredential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  print(userCredential);
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);
                                  if (e.code == 'email-already-in-use') {
                                    Fluttertoast.showToast(
                                      msg: "Invalid credentials",
                                      toastLength: Toast
                                          .LENGTH_LONG, // Duration of the toast
                                      gravity:
                                          ToastGravity.TOP, // Toast position
                                      backgroundColor: Color.fromARGB(255, 199, 36, 11), // Background color of the toast
                                      textColor: Colors
                                          .white, // Text color of the toast
                                    );
                                    print("User with that email already exists");
                                  } else if (e.code == 'weak-password') {
                                    Fluttertoast.showToast(
                                      msg: "Password's too weak",
                                      toastLength: Toast
                                          .LENGTH_LONG, // Duration of the toast
                                      gravity:
                                          ToastGravity.TOP, // Toast position
                                      backgroundColor: Color.fromARGB(255, 199, 36, 11), // Background color of the toast
                                      textColor: Colors
                                          .white, // Text color of the toast
                                    );
                                    print("The password is too weak");
                                  } else if (e.code == 'invalid-email') {
                                    print("Invalid email entered");
                                    Fluttertoast.showToast(
                                      msg: "Invalid email",
                                      toastLength: Toast
                                          .LENGTH_LONG, // Duration of the toast
                                      gravity:
                                          ToastGravity.TOP, // Toast position
                                      backgroundColor: Color.fromARGB(255, 199, 36, 11), // Background color of the toast
                                      textColor: Colors
                                          .white, // Text color of the toast
                                    );
                                  }
                                }
                              },
                              child: Text("Register"),
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
