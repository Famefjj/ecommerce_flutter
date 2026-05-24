import 'package:ecommerce_flutter/common/widgets/app_navigation_menu.dart';
import 'package:ecommerce_flutter/data/mocks/mock_page.dart';
import 'package:ecommerce_flutter/features/shop/pages/home_page.dart';
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
      home: AppNavigationMenu(pages: [
        HomePage(), 
        MockPage(title: "Favorite"), 
        MockPage(title: "Settings"),
        ],
      )
    );
  }
}
