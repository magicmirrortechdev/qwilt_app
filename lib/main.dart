import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/services/services.dart';
import 'src/screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => PortfoliosService()),
        ChangeNotifierProvider(create: (_) => LeasesService()),
        ChangeNotifierProvider(create: (_) => ContactsService()),
        ChangeNotifierProvider(create: (_) => PropertiesService())
      ],
      child: QwiltApp(),
    );
  }
}

class QwiltApp extends StatelessWidget {
  const QwiltApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qwilt',
      debugShowCheckedModeBanner: false,
      initialRoute: 'portfolios',
      routes: {
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'portfolios': (_) => const PortfolioScreen(),
        'properties': (_) => const PropertiesScreen(),
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
