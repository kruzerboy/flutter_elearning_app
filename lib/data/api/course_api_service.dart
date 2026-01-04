import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../../core/errors/api_exception.dart';
import '../../core/network/dio_client.dart';
import '../models/course_model.dart';

class CourseApiService {
  final DioClient _dioClient;

  CourseApiService(this._dioClient);

  // Get all courses
  Future<List<CourseModel>> getAllCourses({
    int? page,
    int? limit,
    String? categoryId,
    String? search,
  }) async {
    try {
      final response = await _dioClient.get(
        ApiConstants.courses,
        queryParameters: {
          if (page != null) 'page': page,
          if (limit != null) 'limit': limit,
          if (categoryId != null) 'categoryId': categoryId,
          if (search != null) 'search': search,
        },
      );
      
      final data = response.data;
      if (data is Map && data['courses'] != null) {
        return (data['courses'] as List)
            .map((course) => CourseModel.fromJson(course))
            .toList();
      } else if (data is List) {
        return data.map((course) => CourseModel.fromJson(course)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Get trending courses
  Future<List<CourseModel>> getTrendingCourses({int? limit}) async {
    try {
      final response = await _dioClient.get(
        ApiConstants.trendingCourses,
        queryParameters: {
          if (limit != null) 'limit': limit,
        },
      );
      
      final data = response.data;
      if (data is Map && data['courses'] != null) {
        return (data['courses'] as List)
            .map((course) => CourseModel.fromJson(course))
            .toList();
      } else if (data is List) {
        return data.map((course) => CourseModel.fromJson(course)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Get recommended courses
  Future<List<CourseModel>> getRecommendedCourses() async {
    try {
      final response = await _dioClient.get(ApiConstants.recommendedCourses);
      
      final data = response.data;
      if (data is Map && data['courses'] != null) {
        return (data['courses'] as List)
            .map((course) => CourseModel.fromJson(course))
            .toList();
      } else if (data is List) {
        return data.map((course) => CourseModel.fromJson(course)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Get bookmarked courses
  Future<List<CourseModel>> getBookmarkedCourses() async {
    try {
      final response = await _dioClient.get(ApiConstants.bookmarkedCourses);
      
      final data = response.data;
      if (data is Map && data['courses'] != null) {
        return (data['courses'] as List)
            .map((course) => CourseModel.fromJson(course))
            .toList();
      } else if (data is List) {
        return data.map((course) => CourseModel.fromJson(course)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Get course by ID
  Future<CourseModel> getCourseById(String courseId) async {
    try {
      final response = await _dioClient.get(
        ApiConstants.courseById(courseId),
      );
      return CourseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Toggle bookmark
  Future<bool> toggleBookmark(String courseId) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.courseBookmark(courseId),
      );
      return response.data['isBookmarked'] ?? false;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
