import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../../core/errors/api_exception.dart';
import '../../core/network/dio_client.dart';
import '../models/category_model.dart';

class CategoryApiService {
  final DioClient _dioClient;

  CategoryApiService(this._dioClient);

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await _dioClient.get(ApiConstants.categories);
      
      final data = response.data;
      if (data is Map && data['categories'] != null) {
        return (data['categories'] as List)
            .map((category) => CategoryModel.fromJson(category))
            .toList();
      } else if (data is List) {
        return data.map((category) => CategoryModel.fromJson(category)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Get category by ID
  Future<CategoryModel> getCategoryById(String categoryId) async {
    try {
      final response = await _dioClient.get(
        ApiConstants.categoryById(categoryId),
      );
      return CategoryModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
