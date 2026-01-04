import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String? thumbnail;
  final String? instructor;
  final String? instructorAvatar;
  final double price;
  final double? discountPrice;
  final double rating;
  final int reviewCount;
  final int studentCount;
  final String? duration;
  final String? level;
  final String categoryId;
  final String? categoryName;
  final List<String>? tags;
  final bool isBookmarked;
  final bool isPurchased;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CourseModel({
    required this.id,
    required this.title,
    required this.description,
    this.thumbnail,
    this.instructor,
    this.instructorAvatar,
    required this.price,
    this.discountPrice,
    required this.rating,
    required this.reviewCount,
    required this.studentCount,
    this.duration,
    this.level,
    required this.categoryId,
    this.categoryName,
    this.tags,
    this.isBookmarked = false,
    this.isPurchased = false,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'],
      instructor: json['instructor']?['name'] ?? json['instructorName'],
      instructorAvatar: json['instructor']?['avatar'],
      price: (json['price'] ?? 0).toDouble(),
      discountPrice: json['discountPrice']?.toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      studentCount: json['studentCount'] ?? json['enrollmentCount'] ?? 0,
      duration: json['duration'],
      level: json['level'],
      categoryId: json['categoryId'] ?? json['category']?['id'] ?? '',
      categoryName: json['category']?['name'] ?? json['categoryName'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      isBookmarked: json['isBookmarked'] ?? false,
      isPurchased: json['isPurchased'] ?? false,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : null,
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'instructor': instructor,
      'instructorAvatar': instructorAvatar,
      'price': price,
      'discountPrice': discountPrice,
      'rating': rating,
      'reviewCount': reviewCount,
      'studentCount': studentCount,
      'duration': duration,
      'level': level,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'tags': tags,
      'isBookmarked': isBookmarked,
      'isPurchased': isPurchased,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  double get finalPrice => discountPrice ?? price;

  bool get hasDiscount => discountPrice != null && discountPrice! < price;

  int get discountPercentage {
    if (!hasDiscount) return 0;
    return (((price - discountPrice!) / price) * 100).round();
  }

  CourseModel copyWith({
    String? id,
    String? title,
    String? description,
    String? thumbnail,
    String? instructor,
    String? instructorAvatar,
    double? price,
    double? discountPrice,
    double? rating,
    int? reviewCount,
    int? studentCount,
    String? duration,
    String? level,
    String? categoryId,
    String? categoryName,
    List<String>? tags,
    bool? isBookmarked,
    bool? isPurchased,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CourseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      instructor: instructor ?? this.instructor,
      instructorAvatar: instructorAvatar ?? this.instructorAvatar,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      studentCount: studentCount ?? this.studentCount,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      tags: tags ?? this.tags,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isPurchased: isPurchased ?? this.isPurchased,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        thumbnail,
        instructor,
        instructorAvatar,
        price,
        discountPrice,
        rating,
        reviewCount,
        studentCount,
        duration,
        level,
        categoryId,
        categoryName,
        tags,
        isBookmarked,
        isPurchased,
        createdAt,
        updatedAt,
      ];
}
