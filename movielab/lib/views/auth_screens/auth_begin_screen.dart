import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../views/main_screen.dart';
import '../../views/begin_screen.dart';
import '../../views/auth_screens/registration_screen.dart';
import '../../tools/colors.dart';
import '../../tools/styles.dart';
import '../../config/uri.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse('$backendUrl/auth/login'), // Use the custom backend URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()));
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: redColor1,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: redColor1,
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: height),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const BeginScreen()),
                              ),
                              child: const Icon(Icons.arrow_back_ios,
                                  color: color2),
                            ),
                            SizedBox(height: height * 0.08),
                            const Text('Sign In',
                                style: bigSizeStyle,
                                textAlign: TextAlign.center),
                            SizedBox(height: height * 0.02),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Form(
                        key: _formKey,
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: color2,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width * 0.08),
                              topLeft: Radius.circular(width * 0.08),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-2, -5),
                                  blurRadius: 5),
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.08),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(width),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: hintStyle,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: height * 0.02),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(width),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: hintStyle,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: color1,
                                      ),
                                      onPressed: _togglePasswordVisibility,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(
                                      right: width * 0.05, top: height * 0.03),
                                  child: const Text('Forget Password?',
                                      style: blackStyle),
                                ),
                                SizedBox(height: height * 0.03),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(width)),
                                    backgroundColor: color1,
                                    fixedSize: Size(width * 0.8, height * 0.07),
                                  ),
                                  onPressed: _isLoading ? null : _signIn,
                                  child: _isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white)
                                      : const Text('Sign in',
                                          style: whiteStyle),
                                ),
                                SizedBox(height: height * 0.01),
                                TextButton(
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationScreen()),
                                  ),
                                  child: const Text('Create new account',
                                      style: TextStyle(color: color1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
