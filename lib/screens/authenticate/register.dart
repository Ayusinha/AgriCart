import 'package:flutter/material.dart';
import 'package:ecom/services/auth.dart';

enum Character { Farmer, Buyer }

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();

  //text fiels state
  String email= '';
  String password='';
  String error='';
  String phone='';
  Character _character = Character.Farmer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0.2,
        title: Text('Sign up to Agri Cart App'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 30.0),
        child: Form(
          key: _formKey,
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
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) => value.length <10 ? 'Enter a Valid 10 digit Mobile number' : null,
                onChanged: (value){
                  setState(() => phone = value);
                },
              ),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  RadioListTile<Character>(
                    title: const Text('Lafayette'),
                    value: Character.Farmer,
                    groupValue: _character,
                    onChanged: (Character value) { setState(() { _character = value; }); },
                  ),
                  RadioListTile<Character>(
                    title: const Text('Thomas Jefferson'),
                    value: Character.Buyer,
                    groupValue: _character,
                    onChanged: (Character value) { setState(() { _character = value; }); },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                    if(result == null){
                      setState(()=> error = 'Please enter a valid email and password');
                    }
//                    print(email);
//                    print(password);
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
    );
  }
}
