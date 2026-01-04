import 'package:equatable/equatable.dart';
import 'course_model.dart';

class CartItemModel extends Equatable {
  final String id;
  final String courseId;
  final CourseModel? course;
  final DateTime? addedAt;

  const CartItemModel({
    required this.id,
    required this.courseId,
    this.course,
    this.addedAt,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? json['_id'] ?? '',
      courseId: json['courseId'] ?? json['course']?['id'] ?? '',
      course: json['course'] != null 
          ? CourseModel.fromJson(json['course']) 
          : null,
      addedAt: json['addedAt'] != null 
          ? DateTime.parse(json['addedAt']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'course': course?.toJson(),
      'addedAt': addedAt?.toIso8601String(),
    };
  }

  CartItemModel copyWith({
    String? id,
    String? courseId,
    CourseModel? course,
    DateTime? addedAt,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      course: course ?? this.course,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  List<Object?> get props => [id, courseId, course, addedAt];
}

class CartModel extends Equatable {
  final List<CartItemModel> items;
  final double total;
  final int itemCount;

  const CartModel({
    required this.items,
    required this.total,
    required this.itemCount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final itemsList = json['items'] ?? [];
    final items = (itemsList as List)
        .map((item) => CartItemModel.fromJson(item))
        .toList();
    
    return CartModel(
      items: items,
      total: (json['total'] ?? 0).toDouble(),
      itemCount: json['itemCount'] ?? items.length,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'itemCount': itemCount,
    };
  }

  bool get isEmpty => items.isEmpty;

  CartModel copyWith({
    List<CartItemModel>? items,
    double? total,
    int? itemCount,
  }) {
    return CartModel(
      items: items ?? this.items,
      total: total ?? this.total,
      itemCount: itemCount ?? this.itemCount,
    );
  }

  @override
  List<Object?> get props => [items, total, itemCount];
}
