import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_app/core/hive/hive_type_adapters/user_type_adapter.dart';
import 'package:medical_app/core/services/shared_prefrences_service/shared_prefrences.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/splash/presentation/views/splash_view.dart';
import 'package:medical_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefrencesService.initSharedPrefrences();
  ServiceLocator.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelTypeAdapter());
  await GetUserData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SplashView(),
      ),
    );
  }
}
