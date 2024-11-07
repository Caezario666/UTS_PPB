import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _register() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (username.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
      prefs.setString('username', username);
      prefs.setString('password', password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registrasi berhasil! Silakan login.'),
          backgroundColor: Colors.lightBlue,
        ),
      );

      // Navigate back to Login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password dan konfirmasi tidak cocok')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Silakan masukkan semua informasi')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Register', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
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
                SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  child: Text('Register', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Sudah punya akun? Login di sini",
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
