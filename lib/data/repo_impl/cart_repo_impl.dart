// import 'package:circ/data/data_sources/remote/cart_rds.dart';
// import 'package:circ/domain/repository/cart_repository.dart';

// import '../models/home/products.dart';

// class CartRepoImpl implements CartRepository {
//   final CartRds _cartRds = CartRds();

//   /// Add to cart
//   @override
//   Future<bool?> addToCart({String? id}) async {
//     try {
//       return await _cartRds.addToCart(id: id);
//     } catch (e) {
//       throw Exception('Error in repository during add to cart: $e');
//     }
//   }

//   /// Get cart
//   @override
//   Future<Products> getCart() {
//     try {
//       return _cartRds.getCart();
//     } catch (e) {
//       throw Exception('Error in repository during get cart: $e');
//     }
//   }

//   /// Remove from cart
//   @override
//   Future<bool?> removeFromCart({String? id}) {
//     try {
//       return _cartRds.removeFromCart(id: id);
//     } catch (e) {
//       throw Exception('Error in repository during remove from cart: $e');
//     }
//   }
// }
