import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_detail_entity.dart';
import 'package:test_interview/features/my_cases/presentation/pages/request_detail_page.dart';
import 'package:test_interview/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/network/api.dart';
import 'features/my_cases/presentation/pages/request_list_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  //the ssl on the api has been expired so we override all http calls
  HttpOverrides.global = MyHttpOverrides();

  //adding access token , we did it this way only for test since we do not have any authorization
  Api.accessToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY2ODUzNjY1LCJqdGkiOiIxMjYxYzljNWU2ODE0Yjk1OTMwMWE3NTcwY2ZlODhhOSIsInVzZXJfaWQiOjgyfQ.pKAAY06Ai5ep2RktLNB1Ho8V594rXUZG9LqkUoyoqbU";

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      routes: {
        '/home': (context) => RequestListPage(),
        '/detail': (context) => RequestDetailPage(
            requestDetailEntity: ModalRoute.of(context)!.settings.arguments
                as RequestDetailEntity),
      },
      initialRoute: '/home',
    );
  }
}
