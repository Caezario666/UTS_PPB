import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard_screen.dart'; // Ensure this import is present for using DashboardScreen
import 'register_screen.dart'; // Import RegisterScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    String password = _passwordController.text;
    String savedUsername = prefs.getString('username') ?? '';
    String savedPassword = prefs.getString('password') ?? '';

    if (username == savedUsername && password == savedPassword) {
      _onLoginSuccess(username); // Pass the username to the success function
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Username atau password salah')));
    }
  }

  void _onLoginSuccess(String username) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );

    // Personalized notification for successful login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login berhasil, $username! Selamat datang.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/ambu.jpg',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text('Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _navigateToRegister,
                  child: Text(
                    "Belum punya akun? Buat dulu di sini",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
