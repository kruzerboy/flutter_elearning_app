import '../api/course_api_service.dart';
import '../models/course_model.dart';

class CourseRepository {
  final CourseApiService _courseApiService;

  CourseRepository(this._courseApiService);

  // Get all courses
  Future<List<CourseModel>> getAllCourses({
    int? page,
    int? limit,
    String? categoryId,
    String? search,
  }) async {
    return await _courseApiService.getAllCourses(
      page: page,
      limit: limit,
      categoryId: categoryId,
      search: search,
    );
  }

  // Get trending courses
  Future<List<CourseModel>> getTrendingCourses({int? limit}) async {
    return await _courseApiService.getTrendingCourses(limit: limit);
  }

  // Get recommended courses
  Future<List<CourseModel>> getRecommendedCourses() async {
    return await _courseApiService.getRecommendedCourses();
  }

  // Get bookmarked courses
  Future<List<CourseModel>> getBookmarkedCourses() async {
    return await _courseApiService.getBookmarkedCourses();
  }

  // Get course by ID
  Future<CourseModel> getCourseById(String courseId) async {
    return await _courseApiService.getCourseById(courseId);
  }

  // Toggle bookmark
  Future<bool> toggleBookmark(String courseId) async {
    return await _courseApiService.toggleBookmark(courseId);
  }
}
