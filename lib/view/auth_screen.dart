import 'package:eccomernce/view/home_screen.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  static const String id = "authentication_screen";
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
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
            const TextField(
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
            ),
            SizedBox(
              height: 20,
            ),
            const TextField(
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
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
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
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.id);

            }, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
