import '../api/cart_api_service.dart';
import '../models/cart_model.dart';

class CartRepository {
  final CartApiService _cartApiService;

  CartRepository(this._cartApiService);

  // Get cart
  Future<CartModel> getCart() async {
    return await _cartApiService.getCart();
  }

  // Add to cart
  Future<CartModel> addToCart(String courseId) async {
    return await _cartApiService.addToCart(courseId);
  }

  // Remove from cart
  Future<CartModel> removeFromCart(String cartItemId) async {
    return await _cartApiService.removeFromCart(cartItemId);
  }

  // Clear cart
  Future<void> clearCart() async {
    await _cartApiService.clearCart();
  }
}
