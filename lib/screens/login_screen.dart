import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oriental_management/screens/forgot_password_screen.dart';
import 'package:oriental_management/screens/register_screen.dart';
import 'package:oriental_management/services/auth_service.dart';
import 'package:oriental_management/widgets/greeting_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _login(BuildContext context) async {
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
      } on FirebaseAuthException catch (error) {
        setState(() {
          _isLoading = false;
        });
        if (error.code == 'user-not-found') {
          print('No user found for that email.');
          showSnackBar(context: context, title: 'User not found');
        }
        if (error.code == 'wrong-password') {
          showSnackBar(context: context, title: 'Wrong password');
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarColor: Colors.white54,
        statusBarColor: Color.fromRGBO(0, 141, 82, 1),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 38, 40, 1),
      body: _isLoading == true
          ? Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    greetingWidget(),
                    SizedBox(height: 30.0),
                    Container(
                      padding:
                          EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                            key: ValueKey('email'),
                            onSaved: (value) => _email = value,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            validator: (value) =>
                                !(value!.contains('@gmail.com'))
                                    ? 'Invalid Email'
                                    : null,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.green,
                              ),
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                              ),
                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          TextFormField(
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                            key: ValueKey('password'),
                            onSaved: (value) => _password = value,
                            obscureText: _hidePassword,
                            controller: _passwordController,
                            validator: (value) =>
                                value!.length < 6 ? 'Password too short' : null,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Montserrat'),
                              prefixIcon: Icon(Icons.lock, color: Colors.green),
                              suffixIcon: IconButton(
                                color: Colors.green,
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
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'PASSWORD',
                              hintText: 'Enter Your Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                context,
                                ForgotPaswordScreen.routeName,
                              ),
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.9,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          ElevatedButton(
                            onPressed: () => _login(context),
                            child: Padding(
                              padding: const EdgeInsets.all(11.5),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: () => googleSignIn(context),
                            child: Container(
                              height: 46.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        child: Image.asset('assets/google.png'),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Center(
                                      child: Text(
                                        'Log In with Google',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 16.0,
                                          letterSpacing: 1.0,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 22.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Need an account?',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RegisterScreen.routeName,
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
