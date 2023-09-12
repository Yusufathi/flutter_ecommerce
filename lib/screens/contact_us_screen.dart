import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Name: $_name, Email: $_email, Message: $_message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onSaved: (value) => _name = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Message'),
              onSaved: (value) => _message = value,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
