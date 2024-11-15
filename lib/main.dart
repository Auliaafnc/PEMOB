import 'package:flutter/material.dart';

import 'core/navigation/navigation_service.dart';
import 'domain/usecases/navigate_to_page.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/my_map_page.dart';
import 'presentation/pages/tracking_info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize services and controllers
    final navigationService = NavigationService();
    final navigateToPageUseCase = NavigateToPageUseCase(navigationService);
    final homeController = HomeController(navigateToPageUseCase);

    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey, // Use global navigator key
      title: 'utspemob',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(homeController),
        '/mymaps': (context) => MyMapPage(homeController),
        '/settings': (context) => TrackingInfoPage(homeController),
      },
    );
  }
}
