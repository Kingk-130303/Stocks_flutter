import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
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
        child: LayoutBuilder(
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
                        decoration: InputDecoration(
                          hintText: "Enter Your email here",
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: textFieldWidth,
                      child: TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          hintText: "Enter Your password here",
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => {print("Button Pressed")},
                      child: Text("Register"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
