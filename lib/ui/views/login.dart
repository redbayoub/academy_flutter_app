import 'package:flutter/material.dart';
import 'package:my_academy/api/auth_api.dart';
import 'package:my_academy/models/appstate.dart';
import 'package:my_academy/ui/customs/PasswordField.dart';
import 'package:my_academy/ui/customs/Snackbars.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _error;
  String _email;
  String _password;

  Future _attemptLogin(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); //onSaved is called!
      showSimpleSnackbar(_scaffoldKey, "Logging in .....");

      print("attemptLogin $_email : $_password");
      final response = await loginApiRequest(_email, _password);
      if (response['stutus'] == 200) {
        showSucsessSnackbar(_scaffoldKey, "You're Logged in");

        var appState = AppStateModel.of(context, true);
        appState.logIn(response);
        Navigator.pushReplacementNamed(context, '/HomePage');
      } else {
        print(response);
        showErrorSnackbar(_scaffoldKey, 'Error : ${response['message']}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
/*     var appState = AppStateModel.of(context, true);
    if (appState.authenticated)
      Navigator.pushReplacementNamed(context, '/HomePage'); */
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login"),
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
              _buildEmailField(),
              _buildPasswordField(),
              _buildLoginButton(context)
            ],
          ),
        ));
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
        if (value.isEmpty) return "this field is required";
      },
      onSaved: (newValue) => _password = newValue,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () => _attemptLogin(context),
    );
  }
}
