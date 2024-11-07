import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart'; // Import the LoginScreen

class UpdateUserScreen extends StatefulWidget {
  @override
  _UpdateUserScreenState createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  // Load user information from SharedPreferences
  void _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username') ?? '';
    _usernameController.text = username;
    // Password not stored for security; prompt the user to enter a new password
  }

  // Update user information
  void _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password.isNotEmpty && password == confirmPassword) {
      // Save new user information
      await prefs.setString('username', username);
      // Add logic to save password if necessary

      _onUserUpdateSuccess(); // Call function to show update success notification
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password dan konfirmasi tidak cocok')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Silakan masukkan password')));
    }
  }

  void _onUserUpdateSuccess() {
    Navigator.pop(context); // Go back to the previous screen

    // Notification for successful user update
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Informasi pengguna berhasil diperbarui!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  // Function for logout
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username'); // Remove username from SharedPreferences

    // Go back to LoginScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

    // Notification for successful logout
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Anda telah logout.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update User & Password')),
      body: Center( // Center the content
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 400), // Set a maximum width for the form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                SizedBox(height: 10), // Add spacing
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 10), // Add spacing
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20), // Add spacing
                ElevatedButton(
                  onPressed: _updateUserInfo,
                  child: Text('Simpan Perubahan'),
                ),
                SizedBox(height: 30), // Increased space between buttons
                ElevatedButton(
                  onPressed: _logout,
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Set button color
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Customize padding
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
