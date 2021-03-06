import 'package:flutter/material.dart';
import 'package:uddhriti/constants.dart';
import 'package:uddhriti/screens/home_screen.dart';
import 'package:uddhriti/screens/sign_in_screen.dart';
import 'package:uddhriti/widgets/textfield.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _username, _email, _password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        height: size.height,
        width: size.width,
        color: kBackgroundColor,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 20.0,
            right: 20.0,
            bottom: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 180.0,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Create Account,",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      "Sign up to get started!",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height:
                    size.height - 260.0 - MediaQuery.of(context).padding.top,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 0.0),
                    children: <Widget>[
                      nameInput(
                        context: context,
                        validator: (name) {
                          Pattern pattern =
                              r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(name))
                            return 'Invalid username';
                          else
                            return null;
                        },
                        onSaved: (name) => _username = name,
                      ),
                      SizedBox(height: 12.0),
                      emailInput(
                        context: context,
                        validator: (email) => EmailValidator.validate(email)
                            ? null
                            : "Invalid email address",
                        onSaved: (email) => _email = email,
                      ),
                      SizedBox(height: 8.0),
                      passwordInput(
                        context: context,
                        validator: (password) {
                          Pattern pattern =
                              r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(password))
                            return 'Must contain 6 characters including one letter and one number';
                          else
                            return null;
                        },
                        onSaved: (password) => _password = password,
                      ),
                      SizedBox(height: 25.0),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                          }
                        },
                        child: Container(
                          height: 55.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              gradient: LinearGradient(
                                  colors: [kPrimaryColor, kSecondaryColor],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.55, 1.0])),
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        height: 55.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey[300]),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 28.0,
                                width: 28.0,
                                color: Color(0xFF000090),
                                child: Center(
                                  child: Text(
                                    "f",
                                    style: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Connect with Facebook",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000090),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "I'm already a member,",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SignInPage()));
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
