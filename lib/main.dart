import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elearning_app/core/injection_container.dart';
import 'package:flutter_elearning_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_elearning_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_elearning_app/bloc/course/course_bloc.dart';
import 'package:flutter_elearning_app/presentations/screens/on_boarding/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(FlutterELearningApp());
}

class FlutterELearningApp extends StatelessWidget {
  final String validPin = "123456";
  
  FlutterELearningApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>()..add(const AuthCheckStatus()),
        ),
        BlocProvider<CourseBloc>(
          create: (_) => getIt<CourseBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (_) => getIt<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter eLearning App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        //  OTPPage(phoneNumber: '',),
      ),
    );
  }
}

