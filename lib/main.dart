import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

import 'core/constants/routes.dart';
import 'core/router/app_router.dart';
import 'providers/portfolio_provider.dart';
import 'theme/app_theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return PortfolioProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: Routes.home,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
