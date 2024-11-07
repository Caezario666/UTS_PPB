import 'package:flutter/material.dart';
import 'payment_screen.dart';
import 'models.dart';

class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart});

  void _proceedToPayment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentScreen(cart: cart)),
    );
  }

  void _removeItem(BuildContext context, int index) {
    cart.removeItem(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item telah dihapus dari keranjang!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  void _increaseQuantity(int index) {
    cart.items[index].quantity++;
  }

  void _decreaseQuantity(BuildContext context, int index) {
    if (cart.items[index].quantity > 1) {
      cart.items[index].quantity--;
    } else {
      _removeItem(context, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keranjang Belanja')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.product.name, style: TextStyle(color: Colors.white)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Qty: ${item.quantity}", style: TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () => _decreaseQuantity(context, index),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () => _increaseQuantity(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text("Rp ${item.product.price * item.quantity}", style: TextStyle(color: Colors.white)),
                );
              },
            ),
          ),
          // This part will now be centered vertically
          Expanded(
            flex: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  Text(
                    "Total: Rp ${cart.getTotal()}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20), // Add space between the total and button
                  ElevatedButton(
                    onPressed: () => _proceedToPayment(context),
                    child: Text('Lanjut ke Pembayaran'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50), // Adjust button size
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      textStyle: TextStyle(fontSize: 16), // Adjust button text size
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
