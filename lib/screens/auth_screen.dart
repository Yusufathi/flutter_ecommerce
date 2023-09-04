
import 'package:eccomernce/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "authentication_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _password = "";
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Auth Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.red,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.red,
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.red,
                )),
              ),
              onChanged: (String newEmail) {
                _email = newEmail;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.red,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.red,
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.red,
                )),
              ),
              onChanged: (String newPassword) {
                _password = newPassword;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text('Don\'t Have an account? '),
                Text(
                  'Register Now!',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_password == "admin" && _email == "admin") {
                    Navigator.of(context).pushNamed(HomeScreen.id);
                  } else {
                    showAlertDialog(context,"The password or the email is incorrect");
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context,String msg) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
