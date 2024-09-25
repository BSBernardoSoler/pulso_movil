import 'package:flutter/material.dart';

class Registrologin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistroLoginScreen(),
    );
  }
}

class RegistroLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo at the top
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo.png'), // Ruta de tu imagen
              ),
            ),
            SizedBox(height: 20),
            // Title text
            Text(
              'Create an Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            // Facebook button
            ElevatedButton.icon(
              icon: Image.asset('assets/facebook.png', width: 24),
              label: Text('Continue with Facebook'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Acción al presionar Facebook
              },
            ),
            SizedBox(height: 10),
            // Google button
            ElevatedButton.icon(
              icon: Image.asset('assets/google.png', width: 24),
              label: Text('Continue with Google'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Acción al presionar Google
              },
            ),
            SizedBox(height: 10),
            // Apple button
            ElevatedButton.icon(
              icon: Image.asset('assets/iphone.png', width: 40),
              label: Text('Continue with Apple'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Acción al presionar Apple
              },
            ),
            SizedBox(height: 10),
            // OR text
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('or'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 10),
            // Sign up with email
            ElevatedButton(
              child: Text('Sign Up with Email'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Acción al presionar el registro con email
              },
            ),
          ],
        ),
      ),
    );
  }
}
