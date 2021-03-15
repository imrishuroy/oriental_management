import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oriental_management/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String? _email;
  String? _password;

  bool _hidePassword = true;
  bool _isLoading = false;

  void _login() async {
    final form = _formKey.currentState!;
    FocusScope.of(context).unfocus();
    if (form.validate()) {
      form.save();
      try {
        setState(() {
          _isLoading = true;
        });
        // UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );
        // print(userCredential);
        Navigator.pushReplacementNamed(context, '/');
      } on FirebaseAuthException catch (error) {
        setState(() {
          _isLoading = false;
        });
        if (error.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'User not found',
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
        if (error.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Wrong password',
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 141, 82, 1),
        title: Text('Log In User'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70.0),
            Text(
              'Log In',
              style: GoogleFonts.rockSalt(
                color: Color.fromRGBO(255, 203, 0, 1),
                fontSize: 50.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Card(
                margin: EdgeInsets.all(20.0),
                elevation: 10.0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 15.0,
                            ),
                            child: TextFormField(
                              key: ValueKey('email'),
                              onSaved: (value) => _email = value,
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (value) =>
                                  !(value!.contains('@gmail.com'))
                                      ? 'Invalid Email'
                                      : null,
                              decoration: InputDecoration(
                                //icon: Icon(Icons.mail),
                                prefixIcon: Icon(Icons.mail),
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 15.0,
                            ),
                            child: TextFormField(
                              key: ValueKey('password'),
                              onSaved: (value) => _password = value,
                              obscureText: _hidePassword,
                              controller: _passwordController,
                              validator: (value) => value!.length < 6
                                  ? 'Password too short'
                                  : null,
                              decoration: InputDecoration(
                                // icon: Icon(Icons.lock),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _hidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _hidePassword = !_hidePassword;
                                    });
                                  },
                                ),
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          if (_isLoading) CircularProgressIndicator(),
                          if (!_isLoading)
                            ElevatedButton(
                              //  color: Color.fromRGBO(0, 141, 82, 1),
                              onPressed: () {
                                _login();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          if (!_isLoading)
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              },
                              child: Text(
                                'Need an account? Register',
                                style: TextStyle(
                                  fontSize: 15.5,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
