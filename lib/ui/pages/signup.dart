import 'package:flutter/material.dart';
import 'package:my_academy/api/auth_api.dart';
import 'package:my_academy/models/appstate.dart';
import 'package:my_academy/ui/customs/PasswordField.dart';
import 'package:my_academy/ui/customs/Snackbars.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email,
      _username,
      _password,
      _rewrite_password,
      _first_name,
      _last_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Sign Up"),
      ),
      body: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildFirstNameField(),
              _buildLastNameField(),
              _buildUsernameField(),
              _buildEmailField(),
              _buildPasswordField(),
              _buildRewritePasswordField(),
              _buildSignUpButton(context),
              _buildAllredyHaveAccount(context),
            ],
          ),
        ));
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "First Name",
        labelText: "First Name",
      ),
      validator: (String value) {
        if (value.isEmpty) return 'This field is required';
      },
      onSaved: (newValue) => _first_name = newValue,
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Last Name",
        labelText: "Last Name",
      ),
      validator: (String value) {
        if (value.isEmpty) return 'This field is required';
      },
      onSaved: (newValue) => _last_name = newValue,
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Username",
        labelText: "Username",
      ),
      validator: (String value) {
        if (value.isEmpty) return 'This field is required';
      },
      onSaved: (newValue) => _username = newValue,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        labelText: "Email",
      ),
      validator: (String value) {
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'This is not a valid email';
        }
      },
      onSaved: (newValue) => _email = newValue,
    );
  }

  Widget _buildPasswordField() {
    return PasswordField(
      hintText: "Password",
      labelText: "Password",
      validator: (String value) {
        if (value.isEmpty) return "This field is required";
      },
      onSaved: (newValue) => _password = newValue,
    );
  }

  Widget _buildRewritePasswordField() {
    return PasswordField(
      hintText: "Re-write the password",
      labelText: "Password Confirmation",
      validator: (String value) {
        if (value.isEmpty)
          return 'This field is required';
        else if (value != _password)
          return "This field dosn't match password field";
      },
      onSaved: (newValue) => _rewrite_password = newValue,
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return RaisedButton(
      child: Text("Sign Up"),
      onPressed: () => _attemptSignUp(context),
    );
  }

  Widget _buildAllredyHaveAccount(BuildContext context) {
    return GestureDetector(
      child: Text(
        "You Allredy Have Account, login",
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
            decorationColor: Colors.blue),
      ),
      onTap: () => Navigator.pushReplacementNamed(context, "/LoginPage"),
    );
  }

  Future _attemptSignUp(BuildContext context) async {
    _formKey.currentState.save(); //onSaved is called!
    if (_formKey.currentState.validate()) {
      showSimpleSnackbar(_scaffoldKey, "Sign in .....");

      print("attempSignUp $_email : $_password");
      final response = await signUpApiRequest(
          _first_name, _last_name, _username, _email, _password);
      if (response['status'] == 200) {
        showSucsessSnackbar(_scaffoldKey, "You're signed up");

        var appState = AppStateModel.of(context, true);
        appState.signup(response);
        Navigator.pop(context);
      } else {
        print(response);
        showErrorSnackbar(_scaffoldKey, 'Error : ${response['message']}');
      }
    }
  }
}
