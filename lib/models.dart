// lib/models.dart

class Product {
  final String name;
  final String image;
  final String description;
  final int price;
  final int stock;
  final List<String> ingredients;

  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.stock,
    required this.ingredients,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class Cart {
  final List<CartItem> items = [];

  void addItem(Product product) {
    final existingItem = items.firstWhere(
          (item) => item.product.name == product.name,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  int getTotal() {
    return items.fold(0, (total, item) => total + (item.product.price * item.quantity));
  }

  void clearCart() {
    items.clear();
  }
}
