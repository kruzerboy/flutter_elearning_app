import 'package:get_it/get_it.dart';
import 'package:flutter_elearning_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_elearning_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_elearning_app/bloc/course/course_bloc.dart';
import 'package:flutter_elearning_app/core/network/dio_client.dart';
import 'package:flutter_elearning_app/data/api/auth_api_service.dart';
import 'package:flutter_elearning_app/data/api/cart_api_service.dart';
import 'package:flutter_elearning_app/data/api/category_api_service.dart';
import 'package:flutter_elearning_app/data/api/course_api_service.dart';
import 'package:flutter_elearning_app/data/api/user_api_service.dart';
import 'package:flutter_elearning_app/data/repositories/auth_repository.dart';
import 'package:flutter_elearning_app/data/repositories/cart_repository.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Core
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // API Services
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<CourseApiService>(
    () => CourseApiService(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<CategoryApiService>(
    () => CategoryApiService(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<CartApiService>(
    () => CartApiService(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<UserApiService>(
    () => UserApiService(getIt<DioClient>()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthApiService>()),
  );
  getIt.registerLazySingleton<CourseRepository>(
    () => CourseRepository(getIt<CourseApiService>()),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepository(getIt<CartApiService>()),
  );

  // BLoCs
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthRepository>()),
  );
  getIt.registerFactory<CourseBloc>(
    () => CourseBloc(getIt<CourseRepository>()),
  );
  getIt.registerFactory<CartBloc>(
    () => CartBloc(getIt<CartRepository>()),
  );
}

