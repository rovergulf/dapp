import 'package:dapp_example/pages/home.dart';
import 'package:dapp_example/themes.dart';
import 'package:dapp_example/routes.dart';
import 'package:dapp/constants.dart';
import 'package:dapp/app/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/dapp_example_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:provider/provider.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  bool isTestMode;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: AppOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            restorationScopeId: 'example-root',
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context).appTitle,
            themeMode: AppOptions.of(context).themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            locale: AppOptions.of(context).locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              return locale;
            },
            onGenerateRoute: RouteConfiguration.onGenerateRoute,
            initialRoute: HomeRoute.routeName,
          );
        },
      ),
    );
  }
}
