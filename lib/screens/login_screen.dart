import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:oriental_management/screens/register_screen.dart';
import 'package:oriental_management/services/auth_service.dart';
import 'package:provider/provider.dart';

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

  void showSnackBar({BuildContext? context, String? title}) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
          '$title',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _login(BuildContext ctx) async {
    final form = _formKey.currentState!;
    FocusScope.of(context).unfocus();
    if (form.validate()) {
      form.save();
      try {
        setState(() {
          _isLoading = true;
        });
        // UserCredential userCredential =
        await Provider.of<AuthServices>(context, listen: false)
            .signInWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );
        // print(userCredential);
        // Navigator.pushReplacementNamed(context, '/');
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

  Future googleSignIn(BuildContext context) async {
    final AuthServices auth = Provider.of(context, listen: false);
    try {
      setState(() {
        _isLoading = true;
      });
      await auth.signInWithGoogle();
    } on PlatformException catch (error) {
      setState(() {
        _isLoading = false;
      });
      print(error);
      showSnackBar(context: context, title: error.message);
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
        title: Text(
          'Log In User',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _isLoading == true
            ? Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100.0),
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
                                SizedBox(height: 7.0),
                                Container(
                                  height: 65,
                                  width: 65,
                                  child: Image.asset(
                                    'assets/user.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Welcome, Please login !',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
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
                                      _login(context);
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
                                  ),
                              ],
                            ),
                          ),
                        ),
                        // ),
                      ),
                    ),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () => googleSignIn(context),
                    child: Card(
                      elevation: 6.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              child: Image.asset('assets/google.png'),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.5,
                              ),
                            ),
                            SizedBox(width: 10.0),
                          ],
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
