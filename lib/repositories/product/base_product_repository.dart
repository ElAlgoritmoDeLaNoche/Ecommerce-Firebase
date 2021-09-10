import 'package:ecommerce_firebase/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
