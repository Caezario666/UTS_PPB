import 'package:flutter/material.dart';
import 'models.dart';
import 'dashboard_screen.dart'; // Import your dashboard screen

class PaymentScreen extends StatefulWidget {
  final Cart cart;

  PaymentScreen({required this.cart});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _onPaymentSuccess(BuildContext context, String name) {
    // Navigate to the DashboardScreen and remove the PaymentScreen from the stack
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );

    // Show a success message after navigating, including the user's name
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pembayaran berhasil, $name! Terima kasih telah berbelanja.'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pembayaran')),
      body: Center(  // Center everything inside the body
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
            children: [
              // Total Payment Text
              Text("Total Pembayaran: Rp ${widget.cart.getTotal()}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 20),

              // Nama Pembeli Form
              Container(
                width: 300, // Set a specific width to make the form shorter
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pembeli',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[800],
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),

              // Alamat Form
              Container(
                width: 300, // Set a specific width to make the form shorter
                child: TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[800],
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Bayar Button
              ElevatedButton(
                onPressed: () {
                  // Get the user's name from the text controller
                  String name = _nameController.text.trim();
                  if (name.isEmpty) {
                    name = 'Pelanggan'; // Default name if user doesn't enter one
                  }

                  // Clear the cart and show success message
                  widget.cart.clearCart();
                  _onPaymentSuccess(context, name); // Navigate to dashboard and show personalized message
                },
                child: Text('Bayar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50), // Set the button width to match the form fields
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
