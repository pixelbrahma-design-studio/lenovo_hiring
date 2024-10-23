import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';
import 'package:lenovo_hiring/repository/auth/auth_repository.dart';

class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {
  final formKey = GlobalKey<FormState>();
  AuthRepository authRepository = AuthRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loading = false;

  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromRGBO(222, 6, 191, 1.0),
              Color.fromRGBO(77, 20, 74, 1.0)
            ]),
            image: DecorationImage(
              image: AssetImage("assets/images/grid.png"),
              repeat: ImageRepeat.repeatY,
              opacity: 0.5,
              fit: BoxFit.cover,
            )),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Navbar(),
                  TextFormField(
                    controller: nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value!.trim().isEmpty) {
                        return "Please Enter Valid Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Enter Admin Email',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (value) {
                      String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                      RegExp regex = RegExp(pattern);
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      } else if (!regex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,

                    obscureText: _isPasswordHidden, // Hide the password
                    decoration: InputDecoration(
                      hintText: "Create Your Password",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorStyle: TextStyle(color: Colors.white),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value!.trim().isEmpty) {
                        return "Please Enter Password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
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
                                UserModel userModel = UserModel(
                                    role: "admin",
                                    name: nameController.text
                                        .trim()
                                        .toLowerCase(),
                                    email: emailController.text
                                        .trim()
                                        .toLowerCase(),
                                    collegeName: "",
                                    contactNumber: 0000000000,
                                    degree: "",
                                    courseName: "",
                                    yearOfGraduation: "",
                                    gender: "",
                                    iAgree: true,
                                    acceptPrivacyPolicy: true,
                                    understoodRules: true);
                                try {
                                  setState(() {
                                    loading = true;
                                  });
                                  await authRepository.signUpWithEmail(
                                      userModel,
                                      _passwordController.text.trim());
                                  setState(() {
                                    loading = false;
                                  });
                                  clear();
                                  showDialog(
                                      context: context,
                                      builder: (c) {
                                        return AlertDialog(
                                          title: Text(
                                              "SuccessFully Created - Please confirm the email"),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  c.pop();
                                                  // context.go('/login');
                                                  //context.go('/login');
                                                },
                                                child: Text("OK"))
                                          ],
                                        );
                                      });
                                } catch (e) {
                                  setState(() {
                                    loading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                }
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: const Text(
                                "Register Now",
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Footer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  clear() {
    setState(() {
      nameController.clear();
      emailController.clear();
      _passwordController.clear();

      phoneController.clear();
    });
  }
}
