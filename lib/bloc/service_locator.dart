import 'package:flutter_elearning_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_elearning_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_elearning_app/bloc/course/course_bloc.dart';

import '../../core/network/dio_client.dart';
import '../../data/api/auth_api_service.dart';
import '../../data/api/cart_api_service.dart';
import '../../data/api/category_api_service.dart';
import '../../data/api/course_api_service.dart';
import '../../data/api/user_api_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/cart_repository.dart';
import '../../data/repositories/course_repository.dart';


class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  // Core
  late DioClient _dioClient;

  // API Services
  late AuthApiService _authApiService;
  late CourseApiService _courseApiService;
  late CategoryApiService _categoryApiService;
  late CartApiService _cartApiService;
  late UserApiService _userApiService;

  // Repositories
  late AuthRepository _authRepository;
  late CourseRepository _courseRepository;
  late CartRepository _cartRepository;

  // BLoCs
  late AuthBloc _authBloc;
  late CourseBloc _courseBloc;
  late CartBloc _cartBloc;

  void init() {
    // Initialize Core
    _dioClient = DioClient();

    // Initialize API Services
    _authApiService = AuthApiService(_dioClient);
    _courseApiService = CourseApiService(_dioClient);
    _categoryApiService = CategoryApiService(_dioClient);
    _cartApiService = CartApiService(_dioClient);
    _userApiService = UserApiService(_dioClient);

    // Initialize Repositories
    _authRepository = AuthRepository(_authApiService);
    _courseRepository = CourseRepository(_courseApiService);
    _cartRepository = CartRepository(_cartApiService);

    // Initialize BLoCs
    _authBloc = AuthBloc(_authRepository);
    _courseBloc = CourseBloc(_courseRepository);
    _cartBloc = CartBloc(_cartRepository);
  }

  // Getters
  DioClient get dioClient => _dioClient;
  
  // API Services
  AuthApiService get authApiService => _authApiService;
  CourseApiService get courseApiService => _courseApiService;
  CategoryApiService get categoryApiService => _categoryApiService;
  CartApiService get cartApiService => _cartApiService;
  UserApiService get userApiService => _userApiService;

  // Repositories
  AuthRepository get authRepository => _authRepository;
  CourseRepository get courseRepository => _courseRepository;
  CartRepository get cartRepository => _cartRepository;

  // BLoCs
  AuthBloc get authBloc => _authBloc;
  CourseBloc get courseBloc => _courseBloc;
  CartBloc get cartBloc => _cartBloc;

  // Dispose
  void dispose() {
    _authBloc.close();
    _courseBloc.close();
    _cartBloc.close();
  }
}
