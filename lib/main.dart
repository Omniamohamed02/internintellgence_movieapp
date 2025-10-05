import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:new_movie_app/feature/presention/auth/login_screen.dart';
import 'package:new_movie_app/core/providers/movie_provider.dart';
import 'package:new_movie_app/core/providers/saved_provider.dart';
import 'package:new_movie_app/core/providers/downloaded_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MovieProvider()),
            ChangeNotifierProvider(create: (_) => SavedProvider()),
            ChangeNotifierProvider(create: (_) => DownloadedProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
