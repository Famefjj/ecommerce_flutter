import 'package:ecommerce_flutter/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashApp());
  await Future.delayed(const Duration(seconds: 2));
  runApp(const MyApp());
}

class SplashApp extends StatelessWidget {
  const SplashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF06B976),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/logos/ecom_logo_dark.png'),
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Image(
                image: AssetImage('assets/logos/ecom_brand_dark.png'),
                width: 96,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
