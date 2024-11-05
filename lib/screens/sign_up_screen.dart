import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.red[700],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HUST",
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Welcome to AllHust",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            "Họ",
                          ),
                          flex: 4,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: _buildTextField("Tên"),
                          flex: 6,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildTextField("Email"),
                    SizedBox(
                      height: 20,
                    ),
                    _buildPasswordField("Password"),
                    SizedBox(
                      height: 20,
                    ),
                    _buildRoleField(),
                    SizedBox(
                      height: 30,
                    ),
                    _buildSignUpButton(),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text(
                          "Login with account",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }


  Widget _buildTextField(String text) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white, width: 2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: Colors.white), // Set border color to white when focused
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: Colors.white), // Set border color to white when disabled
        ),
      ),
    );
  }

  Widget _buildPasswordField(String text) {
    return TextField(
      style: TextStyle(color: Colors.white),
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white, width: 2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: Colors.white), // Set border color to white when focused
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: Colors.white), // Set border color to white when disabled
        ),
        suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                _showPassword = ! _showPassword;
              });
            },
            icon: Icon(
              _showPassword ? Icons.visibility: Icons.visibility_off,
              color: Colors.white,
            ))
      ),
    );
  }

  Widget _buildRoleField() {
    return DropdownButtonFormField<String>(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white, width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: Colors.white), // Set border color to white when focused
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: Colors.white), // Set border color to white when disabled
        ),
      ),
      items: ['Student', 'Teacher', 'Admin'].map((String role) {
        return DropdownMenuItem(
          child: Text(
            role,
            style: TextStyle(color: Colors.white),
          ),
          value: role,
        );
      }).toList(),
      onChanged: (String? value) {},
      hint: Text(
        'Role',
        style: TextStyle(color: Colors.white),
      ),
      dropdownColor: Colors.red[700],
      isExpanded: true,
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          'SIGN UP',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red[700]),
        ));
  }
}