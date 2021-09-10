import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    Product(
      name: 'Drink 1',
      category: 'Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1582106245687-cbb466a9f07f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      price: 95.0,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Drink 2',
      category: 'Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1497534446932-c925b458314e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=407&q=80',
      price: 95.0,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: 'Food 1',
      category: 'Food',
      imageUrl:
          'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      price: 65.0,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Food 2',
      category: 'Food',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      price: 65.0,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Desserts 1',
      category: 'Desserts',
      imageUrl:
          'https://images.unsplash.com/photo-1622814651041-b9a3c54d60ab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80',
      price: 80.0,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
