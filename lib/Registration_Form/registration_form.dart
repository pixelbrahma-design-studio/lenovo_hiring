import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? _selectedCollege; // To store the selected value
  String? _selectedDegree; // To store the selected value
  String? _selectedCourseName; // To store the selected value
  String? _selectedYear; // To store selected graduation year
  String? _selectedGender; // To store selected gender

  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;

  // State variables to store passwords
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  bool _isPasswordHidden = true; // To toggle password visibility

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
          child: Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/Smartsprint-logo.png")
          ),
        ),
        SizedBox(height: 30,),
        Container(
          width: screenWidth * 0.6,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.2),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row for side-by-side text fields
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Register for Participating in the contest".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    // Name field
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Name as per Aadhar Card*",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            //cursorColor: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50), // Space between the two fields
                    // Email field
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Email ID (College ID Preferred)*',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            //cursorColor: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),

                Row(
                  children: [
                    // Password
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Create Password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _isPasswordHidden, // Hide the password
                            decoration: InputDecoration(
                              hintText: "Create Your Password",
                              hintStyle: TextStyle(color: Colors.white54),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50), // Space between the two fields
                    // Confirm Password
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Confirm Password
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _isPasswordHidden, // Hide the password
                            decoration: InputDecoration(
                              hintText: "Re-enter Your Password",
                              hintStyle: TextStyle(color: Colors.white54),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),

                Row(
                  children: [
                    // Contact field
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   "Contact Number*",
                          //   style: TextStyle(color: Colors.white),
                          // ),
                          // SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Contact Number*',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            //cursorColor: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50), // Space between the two fields
                    // College Name
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<String>(
                            value: _selectedCollege,
                            hint: Text(
                              "College Name*", 
                              style: TextStyle(color: Colors.white),
                            ),
                            dropdownColor: Color.fromRGBO(255, 255, 255, 1), // Dropdown background color
                            iconEnabledColor: Colors.white, // Dropdown arrow color
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            items: <String>['College A', 'College B', 'College C', 'College D'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Color.fromRGBO(17, 24, 79, 1)), // Dropdown item text color
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedCollege = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),

                Row(
                  children: [
                    // Degree Field
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<String>(
                            value: _selectedDegree,
                            hint: Text(
                              "Degree*", 
                              style: TextStyle(color: Colors.white),
                            ),
                            dropdownColor: Color.fromRGBO(255, 255, 255, 1), // Dropdown background color
                            iconEnabledColor: Colors.white, // Dropdown arrow color
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            items: <String>['BE/Btech', 'Others'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Color.fromRGBO(17, 24, 79, 1)), // Dropdown item text color
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedDegree = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50), // Space between the two fields
                    // Course Name field
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<String>(
                            value: _selectedCourseName,
                            hint: Text(
                              "Course Name*", 
                              style: TextStyle(color: Colors.white),
                            ),
                            dropdownColor: Color.fromRGBO(255, 255, 255, 1), // Dropdown background color
                            iconEnabledColor: Colors.white, // Dropdown arrow color
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            items: <String>['Computer Science', 'Electronics & Comm', 'Electrical & Electronics', 'Information tech', 'Instrumentation'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Color.fromRGBO(17, 24, 79, 1)), // Dropdown item text color
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedCourseName = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),

                Row(
                  children: [
                    // Year of Graduation Field
                    Flexible(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Year of Graduation
                        Text(
                          "Year of Graduation*",
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Radio<String>(
                              value: "2025",
                              groupValue: _selectedYear,
                              fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 0.2)),
                              activeColor: Color.fromRGBO(255, 255, 255, 1), // Change active (selected) color
                              focusColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 1)),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedYear = value;
                                });
                              },
                            ),
                            Text(
                              "2025",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Radio<String>(
                              value: "2024",
                              groupValue: _selectedYear,
                              fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 0.2)),
                              activeColor: Color.fromRGBO(255, 255, 255, 1),
                              focusColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 1)),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedYear = value;
                                });
                              },
                            ),
                            Text(
                              "2024",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Radio<String>(
                              value: "Others",
                              groupValue: _selectedYear,
                              fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 0.2)),
                              activeColor: Color.fromRGBO(255, 255, 255, 1),
                              focusColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 1)),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedYear = value;
                                });
                              },
                            ),
                            Text(
                              "Others",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50), // Space between fields
                  // Gender Field
                   Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Gender
                        Text(
                          "Gender*",
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Radio<String>(
                              value: "Male",
                              groupValue: _selectedGender,
                              fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 0.2)),
                              activeColor: Color.fromRGBO(255, 255, 255, 1),
                              focusColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 1)),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(
                              "Male",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Radio<String>(
                              value: "Female",
                              groupValue: _selectedGender,
                              fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 0.2)),
                              activeColor: Color.fromRGBO(255, 255, 255, 1),
                              focusColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 1)),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(
                              "Female",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Radio<String>(
                              value: "Others",
                              groupValue: _selectedGender,
                              fillColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 0.2)),
                              activeColor: Color.fromRGBO(255, 255, 255, 1),
                              focusColor: WidgetStateColor.resolveWith((states) => Color.fromRGBO(255, 255, 255, 1)),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(
                              "Others",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    )
                  ]
                ),

                SizedBox(height: 30,),

                Column(
                  children: [
                    //checkbox1
                    Row(
                      children: [
                        Checkbox(
                          value: _checkbox1,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox1 = value!;
                            });
                          },
                        ),
                        Text(
                          "By checking this box, I agree to be contacted by Lenovo either through emails or calls",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    //checkbox1
                    Row(
                      children: [
                        Checkbox(
                          value: _checkbox2,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox2 = value!;
                            });
                          },
                        ),
                        Text(
                          "I read and accept the privacy policy.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    //checkbox1
                    Row(
                      children: [
                        Checkbox(
                          value: _checkbox3,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox3 = value!;
                            });
                          },
                        ),
                        Text(
                          "I have read and understood the rules of this program.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
                  child: MaterialButton(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    onPressed: (){
                      context.go('/register');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}


