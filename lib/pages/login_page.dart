import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stocks/firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    late final TextEditingController _email;
  late final TextEditingController _password;

  late final Future<FirebaseApp> _initialization;

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
                    double imageSize = constraints.maxWidth > 600 ? 300.0 : 150.0;
                    double textFieldWidth = constraints.maxWidth > 600
                        ? constraints.maxWidth / 2
                        : constraints.maxWidth;

                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ConstrainedBox(constraints: BoxConstraints(minHeight: 100)),
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
                                  final userCredential =
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                                print(userCredential);
                                }on FirebaseAuthException catch(e){
                                  print(e.code == "invalid-credential");
                                  print(e.runtimeType);
                                }
                                
                              },
                              child: Text("Login"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              
              default:
                return Center(
                  child: Text("Unhandled ConnectionState: ${snapshot.connectionState}"),
                );
            }
          },
        ),
      ),
    );
  }
}