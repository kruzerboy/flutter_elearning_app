import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../../core/errors/api_exception.dart';
import '../../core/network/dio_client.dart';
import '../models/cart_model.dart';

class CartApiService {
  final DioClient _dioClient;

  CartApiService(this._dioClient);

  // Get cart
  Future<CartModel> getCart() async {
    try {
      final response = await _dioClient.get(ApiConstants.cart);
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Add to cart
  Future<CartModel> addToCart(String courseId) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.addToCart,
        data: {'courseId': courseId},
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Remove from cart
  Future<CartModel> removeFromCart(String cartItemId) async {
    try {
      final response = await _dioClient.delete(
        ApiConstants.removeFromCart(cartItemId),
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Clear cart
  Future<void> clearCart() async {
    try {
      await _dioClient.delete(ApiConstants.clearCart);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
