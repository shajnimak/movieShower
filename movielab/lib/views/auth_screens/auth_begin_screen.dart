import 'package:flutter/material.dart';
import '../../views/auth_screens/registration_screen.dart';
import '../../views/begin_screen.dart';
import '../../views/main_screen.dart';
import '../../tools/colors.dart';
import '../../tools/styles.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      print('Signing in with: ${_usernameController.text}');
      // Proceed with backend authentication
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  void _signInWithGoogle() {
    print('Google sign-in triggered');
  }

  void _signInWithFacebook() {
    print('Facebook sign-in triggered');
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
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(width),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Username',
                                    hintStyle: hintStyle,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your username';
                                    }
                                    return null; // Valid input
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
                                    return null; // Valid input
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
                                  onPressed: _signIn,
                                  child:
                                      const Text('Sign in', style: whiteStyle),
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
                                SizedBox(height: height * 0.01),
                                buildOAuthButton('Continue with Google',
                                    'assets/img/google.png', _signInWithGoogle),
                                SizedBox(height: height * 0.01),
                                buildOAuthButton(
                                    'Continue with Facebook',
                                    'assets/img/facebook.png',
                                    _signInWithFacebook),
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

  Widget buildOAuthButton(String text, String imagePath, Function() onTap) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      height: height * 0.06,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
        color: color2,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2))
        ],
        borderRadius: BorderRadius.circular(width),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imagePath, width: width * 0.08),
            Text(text, style: blackStyle),
            const Icon(Icons.arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
