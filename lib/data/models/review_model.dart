import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String id;
  final String courseId;
  final String userId;
  final String? userName;
  final String? userAvatar;
  final double rating;
  final String? comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReviewModel({
    required this.id,
    required this.courseId,
    required this.userId,
    this.userName,
    this.userAvatar,
    required this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? json['_id'] ?? '',
      courseId: json['courseId'] ?? '',
      userId: json['userId'] ?? json['user']?['id'] ?? '',
      userName: json['user']?['name'] ?? json['userName'],
      userAvatar: json['user']?['avatar'] ?? json['userAvatar'],
      rating: (json['rating'] ?? 0).toDouble(),
      comment: json['comment'],
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
      'courseId': courseId,
      'userId': userId,
      'userName': userName,
      'userAvatar': userAvatar,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  ReviewModel copyWith({
    String? id,
    String? courseId,
    String? userId,
    String? userName,
    String? userAvatar,
    double? rating,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        courseId,
        userId,
        userName,
        userAvatar,
        rating,
        comment,
        createdAt,
        updatedAt,
      ];
}
