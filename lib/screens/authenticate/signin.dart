import 'package:ecom/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();

  //text fiels state
  String email= '';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text('Sign in to Agri Cart App'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              },
          ),
        ],
      ),
      body: Container(
//        padding: EdgeInsets.symmetric(vertical: 140.0 , horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter email .' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.length < 8 ? 'Minimum 8 characters are required' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//                    if(result == null){
//                      setState(()=> error = 'wrong credential entered ,ENTER again');
//                    }
                    }
                  },
                ),
                SizedBox(height: 15.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
//        FOR SIGNING IN ANONYMOUSLY...
//        RaisedButton(
//          child: Text('Sign in as Guest'),
//          onPressed: () async {
//            dynamic result = await _auth.signInAnon();
//            if(result == null){
//              print('Error signing in !!!');
//            }else{
//              print('Singed in');
//              print(result);
//            }
//          },
//        ),
      ),
    );
  }
}
