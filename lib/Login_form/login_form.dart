import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/repository/auth/auth_repository.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthRepository authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();

  // State variables to store passwords
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isPasswordHidden = true; // To toggle password visibility
  bool loading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            child: Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/Smartsprint-logo.png")),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: screenWidth * 0.3,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row for side-by-side text fields
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Login to your account".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      // Email field
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              style: TextStyle(
                                color: Colors.white
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email ID*',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.white
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                              ),
                              validator: (value) {
                                String pattern =
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                RegExp regex = RegExp(pattern);
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email address';
                                } else if (!regex.hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              //cursorColor: Colors.pinkAccent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    children: [
                      // Password
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Create Password
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,

                              controller: _passwordController,
                              style: TextStyle(
                                color: Colors.white
                              ),
                              obscureText:
                                  _isPasswordHidden, // Hide the password
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white54),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.white
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordHidden = !_isPasswordHidden;
                                    });
                                  },
                                ),
                              ),
                              //style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value == null || value!.trim().isEmpty) {
                                  return "Please Enter Password";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ))
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 15.0),
                    child: loading
                        ? CircularProgressIndicator()
                        : MaterialButton(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  setState(() {
                                    loading = true;
                                  });
                                  bool loggedIn =
                                      await authRepository.loginUser(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim());
                                  setState(() {
                                    loading = false;
                                  });

                                  if (loggedIn) {
                                    clear();
                                    context.replace('/count_down');
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (c) {
                                          return AlertDialog(
                                            title: Text("Email Not verified"),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    c.pop();
                                                  },
                                                  child: Text("OK"))
                                            ],
                                          );
                                        });
                                  }
                                } catch (e) {
                                  setState(() {
                                    loading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                }
                              }
                              // context.go('/count_down');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Color.fromRGBO(28, 10, 103, 1.0),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  clear() {
    _emailController.clear();
    _passwordController.clear();
  }
}
