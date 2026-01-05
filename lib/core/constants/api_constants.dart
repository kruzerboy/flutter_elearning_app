class ApiConstants {
  // Base URL - Update this with your actual API base URL
  static const String baseUrl = 'http//localhost:3000';
  
  // API Version
  static const String apiVersion = '/api/v1';
  
  // Timeout
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Auth Endpoints
  static const String register = '$apiVersion/auth/register';
  static const String login = '$apiVersion/auth/login';
  static const String sendOtp = '$apiVersion/auth/send-otp';
  static const String verifyOtp = '$apiVersion/auth/verify-otp';
  static const String refreshToken = '$apiVersion/auth/refresh-token';
  static const String logout = '$apiVersion/auth/logout';
  
  // User Endpoints
  static const String profile = '$apiVersion/users/profile';
  static const String changePassword = '$apiVersion/users/change-password';
  
  // Course Endpoints
  static const String courses = '$apiVersion/courses';
  static const String trendingCourses = '$apiVersion/courses/trending';
  static const String recommendedCourses = '$apiVersion/courses/recommended';
  static const String bookmarkedCourses = '$apiVersion/courses/bookmarked';
  
  // Category Endpoints
  static const String categories = '$apiVersion/categories';
  
  // Cart Endpoints
  static const String cart = '$apiVersion/cart';
  static const String addToCart = '$apiVersion/cart/add';
  static const String clearCart = '$apiVersion/cart/clear';
  
  // Payment Endpoints
  static const String createPaymentIntent = '$apiVersion/payments/create-intent';
  static const String confirmPayment = '$apiVersion/payments/confirm';
  static const String paymentHistory = '$apiVersion/payments/history';
  
  // My Courses (Enrollments)
  static const String myCourses = '$apiVersion/my-courses';
  
  // Notifications
  static const String notifications = '$apiVersion/notifications';
  static const String markAllNotificationsRead = '$apiVersion/notifications/read-all';
  
  // Lessons
  static const String lessons = '$apiVersion/lessons';
  
  // Reviews
  static String courseReviews(String courseId) => '$apiVersion/courses/$courseId/reviews';
  static String courseBookmark(String courseId) => '$apiVersion/courses/$courseId/bookmark';
  static String courseById(String courseId) => '$apiVersion/courses/$courseId';
  static String categoryById(String categoryId) => '$apiVersion/categories/$categoryId';
  static String removeFromCart(String cartItemId) => '$apiVersion/cart/$cartItemId';
  static String markNotificationRead(String notificationId) => '$apiVersion/notifications/$notificationId/read';
  static String lessonById(String lessonId) => '$apiVersion/lessons/$lessonId';
  static String lessonVideo(String lessonId) => '$apiVersion/lessons/$lessonId/video';
  static String courseProgress(String courseId) => '$apiVersion/my-courses/$courseId/progress';
  static String markLessonComplete(String courseId, String lessonId) => '$apiVersion/my-courses/$courseId/lessons/$lessonId/complete';
}
