import 'package:ecommerce_flutter/utils/theme/ecom_logo_paint.dart';
import 'package:ecommerce_flutter/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Flutter',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECOM app'),
      ),
      body: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: CustomPaint(
            painter: EcomLogoPainter(strokeColor: AppColors.primary),
          ),
        )
      ),
    );
  }
}
