import 'package:flutter/material.dart';
import 'dart:ui'; // Impor untuk efek blur
import 'cart_screen.dart';
import 'models.dart';
import 'call_center_screen.dart';
import 'sms_center_screen.dart';
import 'location_screen.dart';
import 'update_user_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Product> products = [
    Product(
      name: "Pizza Margherita",
      image: "assets/products/pizza.jpg",
      description: "Pizza tipis yang sederhana namun lezat, terbuat dari adonan pizza, saus tomat, keju mozzarella, dan daun basil segar.",
      price: 100000,
      stock: 20,
      ingredients: ["Adonan pizza", "Saus tomat", "Keju mozzarella", "Daun basil", "Minyak zaitun", "Garam"],
    ),
    Product(
      name: "Pasta Carbonara",
      image: "assets/products/pasta.jpg",
      description: "Pasta yang creamy dan kaya rasa, terbuat dari spaghetti, pancetta, telur, dan keju Parmesan.",
      price: 75000,
      stock: 15,
      ingredients: ["Pasta spaghetti", "Pancetta", "Telur", "Keju Parmesan", "Lada hitam", "Garam"],
    ),
    Product(
      name: "Lasagna",
      image: "assets/products/lasagna.jpg",
      description: "Hidangan berlapis pasta yang dipanggang, diisi dengan daging giling dan saus tomat.",
      price: 60000,
      stock: 10,
      ingredients: ["Pasta lasagna", "Daging giling", "Saus tomat", "Keju ricotta", "Keju mozzarella", "Keju Parmesan", "Bawang bombay", "Bawang putih"],
    ),
    Product(
      name: "Risotto alla Milanese",
      image: "assets/products/risotto.jpg",
      description: "Risotto creamy yang berwarna kuning cerah karena saffron.",
      price: 40000,
      stock: 12,
      ingredients: ["Beras Arborio", "Kaldu", "Saffron", "Bawang bombay", "Keju Parmesan", "Mentega"],
    ),
    Product(
      name: "Gnocchi di Patate",
      image: "assets/products/gnocchi.jpg",
      description: "Bola-bola kecil dari pasta kentang yang lembut, biasanya disajikan dengan saus tomat.",
      price: 55000,
      stock: 18,
      ingredients: ["Kentang", "Tepung terigu", "Telur", "Garam", "Saus tomat atau pesto"],
    ),
    Product(
      name: "Bruschetta",
      image: "assets/products/Bruschetta.jpg",
      description: "Roti panggang yang dilapisi campuran tomat segar, basil, dan minyak zaitun.",
      price: 45000,
      stock: 25,
      ingredients: ["Roti baguette", "Tomat segar", "Daun basil", "Bawang putih", "Minyak zaitun", "Garam"],
    ),
    Product(
      name: "Fettuccine Alfredo",
      image: "assets/products/Fettuccine Alfredo.jpg",
      description: "Pasta fettuccine yang disajikan dengan saus krim kental dan keju Parmesan.",
      price: 65000,
      stock: 15,
      ingredients: ["Pasta fettuccine", "Krim kental", "Keju Parmesan", "Mentega", "Lada hitam"],
    ),
    Product(
      name: "Tiramisu",
      image: "assets/products/tiramisu.jpg",
      description: "Pudding lapis yang kaya rasa dengan mascarpone dan kopi.",
      price: 30000,
      stock: 20,
      ingredients: ["Biskuit savoiardi", "Mascarpone", "Kopi", "Telur", "Gula", "Bubuk kakao"],
    ),
    Product(
      name: "Caprese Salad",
      image: "assets/products/Caprese Salad.jpg",
      description: "Salad segar yang terdiri dari irisan tomat, mozzarella, dan basil.",
      price: 40000,
      stock: 30,
      ingredients: ["Tomat segar", "Keju mozzarella", "Daun basil", "Minyak zaitun", "Garam"],
    ),
    Product(
      name: "Arancini",
      image: "assets/products/arancini.jpg",
      description: "Bola nasi yang diisi dengan ragù dan keju, digoreng hingga kecoklatan.",
      price: 30000,
      stock: 15,
      ingredients: ["Nasi", "Ragù daging", "Keju", "Tepung roti", "Minyak untuk menggoreng"],
    ),
    Product(
      name: "Osso Buco",
      image: "assets/products/osso.jpg",
      description: "Daging betis sapi yang dimasak lambat, disajikan dengan gremolata.",
      price: 90000,
      stock: 8,
      ingredients: ["Daging betis sapi", "Kaldu", "Wortel", "Seledri", "Bawang bombay", "Gremolata"],
    ),
    Product(
      name: "Pasta Puttanesca",
      image: "assets/products/pastaputtanesca.jpg",
      description: "Pasta dengan saus tomat yang kaya, diisi dengan zaitun dan caper.",
      price: 56500,
      stock: 20,
      ingredients: ["Pasta spaghetti", "Saus tomat", "Zaitun hitam", "Caper", "Bawang putih"],
    ),
    Product(
      name: "Polenta",
      image: "assets/products/polenta.jpg",
      description: "Hidangan berbahan dasar jagung yang lembut dan creamy.",
      price: 45000,
      stock: 25,
      ingredients: ["Tepung jagung", "Air atau kaldu", "Mentega", "Keju Parmesan"],
    ),
    Product(
      name: "Espresso",
      image: "assets/products/espresso.jpg",
      description: "Kopi Italia yang pekat dan kaya rasa, disajikan dalam porsi kecil.",
      price: 15000,
      stock: 40,
      ingredients: ["Biji kopi", "Air"],
    ),
    Product(
      name: "Cappuccino",
      image: "assets/products/cappucino.jpg",
      description: "Minuman kopi berbasis espresso dengan tambahan susu kukus dan buih susu.",
      price: 15000,
      stock: 30,
      ingredients: ["Espresso", "Susu kukus", "Buih susu"],
    ),
    Product(
      name: "Limoncello",
      image: "assets/products/limoncelo.jpg",
      description: "Minuman khas Italia berbahan dasar lemon, manis dan menyegarkan.",
      price: 18000,
      stock: 20,
      ingredients: ["Lemon", "Gula", "Alkohol"],
    ),
  ];

  final Cart cart = Cart();

  void _showProductDetails(Product product) {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Atur tingkat blur
        child: AlertDialog(
          title: Text(product.name, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(product.image, height: 100, fit: BoxFit.cover), // Increased image height
              SizedBox(height: 5),
              Text(product.description, style: TextStyle(color: Colors.white, fontSize: 16)), // Increased font size
              Text("Harga: Rp ${product.price}", style: TextStyle(color: Colors.white, fontSize: 14)), // Increased font size
              Text("Stok: ${product.stock}", style: TextStyle(color: Colors.white, fontSize: 14)), // Increased font size
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  cart.addItem(product);
                });
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item "${product.name}" telah ditambahkan ke keranjang!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                );
              },
              child: Text("Tambahkan ke Keranjang", style: TextStyle(color: Colors.blue[400])),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Tutup", style: TextStyle(color: Colors.blue[400])),
            ),
          ],
        ),
      ),
    );
  }

  void _goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
    );
  }

  void _showOptionsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Tambahkan padding
                leading: Icon(Icons.phone, color: Colors.white),
                title: Text("Call Center", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CallCenterScreen()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Tambahkan padding
                leading: Icon(Icons.message, color: Colors.white),
                title: Text("SMS Center", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SmsCenterScreen()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Tambahkan padding
                leading: Icon(Icons.map, color: Colors.white),
                title: Text("Lokasi/Maps", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Tambahkan padding
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text("Update User & Password", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserScreen()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/ambu.jpg', // Ganti dengan path yang sesuai
              height: 30, // Sesuaikan tinggi logo
            ),
            SizedBox(width: 8), // Jarak antara logo dan teks
            Text(
              'Waroeng Ajib',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: _showOptionsMenu,
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8, // Atur rasio aspek untuk produk
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      border: Border.all(color: Colors.white, width: 2), // Border produk
                      borderRadius: BorderRadius.circular(8), // Radius sudut
                    ),
                    child: InkWell(
                      onTap: () => _showProductDetails(product),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100, // Increased height for product image
                            child: Image.asset(product.image, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14, // Increased font size
                              ),
                              textAlign: TextAlign.center, // Menengahkan teks
                            ),
                          ),
                          Text(
                            "Rp ${product.price}",
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 14, // Increased font size
                            ),
                          ),
                          Text(
                            "Bahan: ${product.ingredients.join(', ')}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12, // Increased font size
                            ),
                            textAlign: TextAlign.center, // Menengahkan teks
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCart,
        child: Stack(
          children: [
            Icon(Icons.shopping_cart, color: Colors.white),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Center(
                  child: Text(
                    '${cart.items.length}',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
