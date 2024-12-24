import 'package:bdo/core/services/authprovier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:bdo/view/screens/splash/screen_splash.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        // AuthProvider handles user authentication logic
        ChangeNotifierProvider(create: (_) => AuthProvider()),
 
        // StudentViewModel is responsible for fetching students data
        // ChangeNotifierProvider(create: (_) => StudentViewModel()),
       

        // ApiService to handle API interactions
     

        // LeadProvider depends on ApiService
        
        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
