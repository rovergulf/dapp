import 'package:dapp_example/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/dapp_localizations.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeRoute(),
      title: AppLocalizations.of(context).appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
    );
  }
}
