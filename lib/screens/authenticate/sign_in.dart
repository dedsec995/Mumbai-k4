import 'package:flutter/material.dart';
import 'package:mum_k4/services/auth.dart';
import 'package:mum_k4/shared/loading.dart';
// import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sign_in.jpg"),
            fit: BoxFit.cover,
            // alignment: Alignment.bottomLeft,
          ),
        ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                // backgroundColor: Colors.orange[600],
                elevation: 0.0,
                title: Text('Sign in to Mum K4'),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Colors.red, Colors.blue]),
                  ),
                ),
                // actions: <Widget>[
                //   FlatButton.icon(
                //     icon: Icon(Icons.person),
                //     label: Text("Sign up"),
                //     onPressed: () {
                //       widget.toggleView();
                //     },
                //   ),
                // ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 70.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white.withOpacity(0.4)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          cursorColor: Colors.orangeAccent,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.length < 6 ? 'Enter atleast 6 charater' : null,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white.withOpacity(0.4)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.orangeAccent,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 60.0),
                        RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Either Email or Password is wrong';
                                  loading = false;
                                });
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[Colors.red, Colors.blue]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      60.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'Sign In',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        );
  }
}
