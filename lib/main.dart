import 'package:flutter/material.dart';
import 'package:medical_app/core/services/shared_prefrences_service/shared_prefrences.dart';
import 'package:medical_app/fetures/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrencesService.initSharedPrefrences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SplashView(),
      ),
    );
  }
}
