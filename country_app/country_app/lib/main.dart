import 'package:country_app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'routes/app_pages.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const MaterialColor colorPrimarySwatch = MaterialColor(0xFFEF3844, {
    50: Color(0xFFFCEAE3),
    100: Color(0xFFE55A64),
    200: Color(0xFFE55A64),
    300: Color(0xFFE55A64),
    400: Color(0xFFEF3844),
    500: Color(0xFFEF3844),
    600: Color(0xFFEF3844),
    700: Color(0xFFC12F38),
    800: Color(0xFFC12F38),
    900: Color(0xFFC12F38),
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      defaultTransition: Transition.fadeIn,
      title: 'Country and Cities',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xfff6f6f6),
          fontFamily: 'Raleway',
          primarySwatch: colorPrimarySwatch),
      getPages: AppPages.routes,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
