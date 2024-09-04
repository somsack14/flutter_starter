import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:lod_laos/components/poviders/dark_mode_provider/dark_mode_provider.dart';
import 'package:lod_laos/components/router/router.dart';

import 'components/constants/strings.dart';
import 'components/helpers/dark_mode_preference.dart';
import 'components/helpers/shared_prefs.dart';
import 'components/languages/localization_service.dart';
import 'components/styles/dark_theme_style.dart';
import 'components/styles/size_config.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));

  ///Set Theme data
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  List? _languages = [];
  String? _currentLocale;
  bool _isSupported = false;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    // _initPlatformPushNotification();
    // _initPlatformState();
  }

  void getCurrentAppTheme() async {
    final themeChangeProvider = ref.read(darkThemeProviderProvider);
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    final themeChangeProvider = ref.watch(darkThemeProviderProvider);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);

            return GetMaterialApp.router(
              fallbackLocale: LocalizationService.fallbackLocale,
              locale: LocalizationService.locale,
              translations: LocalizationService(),
              title: " ${Strings.txtAppName.tr} ",
              debugShowCheckedModeBanner: false,
              theme: AppTheme.themeData(themeChangeProvider.darkTheme, context),
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
            );
          },
        );
      },
    );
  }
}
