import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/course_model.dart';
import '../../data/repositories/course_repository.dart';

// Events
abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllCourses extends CourseEvent {
  final int? page;
  final int? limit;
  final String? categoryId;
  final String? search;

  const LoadAllCourses({
    this.page,
    this.limit,
    this.categoryId,
    this.search,
  });

  @override
  List<Object?> get props => [page, limit, categoryId, search];
}

class LoadTrendingCourses extends CourseEvent {
  final int? limit;

  const LoadTrendingCourses({this.limit});

  @override
  List<Object?> get props => [limit];
}

class LoadRecommendedCourses extends CourseEvent {
  const LoadRecommendedCourses();
}

class LoadBookmarkedCourses extends CourseEvent {
  const LoadBookmarkedCourses();
}

class LoadCourseById extends CourseEvent {
  final String courseId;

  const LoadCourseById(this.courseId);

  @override
  List<Object?> get props => [courseId];
}

class ToggleCourseBookmark extends CourseEvent {
  final String courseId;

  const ToggleCourseBookmark(this.courseId);

  @override
  List<Object?> get props => [courseId];
}

// States
abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {
  const CourseInitial();
}

class CourseLoading extends CourseState {
  const CourseLoading();
}

class CourseLoaded extends CourseState {
  final List<CourseModel> courses;

  const CourseLoaded(this.courses);

  @override
  List<Object?> get props => [courses];
}

class CourseDetailLoaded extends CourseState {
  final CourseModel course;

  const CourseDetailLoaded(this.course);

  @override
  List<Object?> get props => [course];
}

class CourseBookmarkToggled extends CourseState {
  final String courseId;
  final bool isBookmarked;

  const CourseBookmarkToggled({
    required this.courseId,
    required this.isBookmarked,
  });

  @override
  List<Object?> get props => [courseId, isBookmarked];
}

class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository _courseRepository;

  CourseBloc(this._courseRepository) : super(const CourseInitial()) {
    on<LoadAllCourses>(_onLoadAllCourses);
    on<LoadTrendingCourses>(_onLoadTrendingCourses);
    on<LoadRecommendedCourses>(_onLoadRecommendedCourses);
    on<LoadBookmarkedCourses>(_onLoadBookmarkedCourses);
    on<LoadCourseById>(_onLoadCourseById);
    on<ToggleCourseBookmark>(_onToggleCourseBookmark);
  }

  Future<void> _onLoadAllCourses(
    LoadAllCourses event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseLoading());
    try {
      final courses = await _courseRepository.getAllCourses(
        page: event.page,
        limit: event.limit,
        categoryId: event.categoryId,
        search: event.search,
      );
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onLoadTrendingCourses(
    LoadTrendingCourses event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseLoading());
    try {
      final courses = await _courseRepository.getTrendingCourses(
        limit: event.limit,
      );
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onLoadRecommendedCourses(
    LoadRecommendedCourses event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseLoading());
    try {
      final courses = await _courseRepository.getRecommendedCourses();
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onLoadBookmarkedCourses(
    LoadBookmarkedCourses event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseLoading());
    try {
      final courses = await _courseRepository.getBookmarkedCourses();
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onLoadCourseById(
    LoadCourseById event,
    Emitter<CourseState> emit,
  ) async {
    emit(const CourseLoading());
    try {
      final course = await _courseRepository.getCourseById(event.courseId);
      emit(CourseDetailLoaded(course));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }

  Future<void> _onToggleCourseBookmark(
    ToggleCourseBookmark event,
    Emitter<CourseState> emit,
  ) async {
    try {
      final isBookmarked = await _courseRepository.toggleBookmark(event.courseId);
      emit(CourseBookmarkToggled(
        courseId: event.courseId,
        isBookmarked: isBookmarked,
      ));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}
