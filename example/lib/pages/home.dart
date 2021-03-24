import 'dart:async';

import 'package:dapp/layout/adaptive.dart';
import 'package:dapp_example/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/dapp_example_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeRoute extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = isDisplayDesktop(context);
    final body = SafeArea(
      child: Padding(
        padding: isDesktop
            ? const EdgeInsets.symmetric(horizontal: 72, vertical: 48)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).homePageTitle,
              style: textTheme.headline3.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              AppLocalizations.of(context).homePageWelcome,
              style: textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );

    if (isDesktop) {
      return Row(
        children: [
          ListDrawer(),
          const VerticalDivider(width: 1),
          Expanded(
            child: Scaffold(
              appBar: const AdaptiveAppBar(
                isDesktop: true,
              ),
              body: body,
              // floatingActionButton: FloatingActionButton.extended(
              //   heroTag: 'Extended Add',
              //   onPressed: () {},
              //   label: Text(
              //     AppLocalizations.of(context).starterAppGenericButton,
              //     style: TextStyle(color: colorScheme.onSecondary),
              //   ),
              //   icon: Icon(Icons.add, color: colorScheme.onSecondary),
              //   tooltip: AppLocalizations.of(context).starterAppTooltipAdd,
              // ),
            ),
          ),
        ],
      );
    } else {
      return Scaffold(
        appBar: const AdaptiveAppBar(),
        body: body,
        drawer: ListDrawer(),
        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'Add',
        //   onPressed: () {},
        //   tooltip: 'Add',
        //   child: Icon(
        //     Icons.add,
        //     color: Theme.of(context).colorScheme.onSecondary,
        //   ),
        // ),
      );
    }
  }
}

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdaptiveAppBar({
    Key key,
    this.isDesktop = false,
  }) : super(key: key);

  final bool isDesktop;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: !isDesktop,
      title: isDesktop
          ? null
          : Text(AppLocalizations.of(context).appTitle),
      bottom: isDesktop
          ? PreferredSize(
        preferredSize: const Size.fromHeight(26),
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          margin: const EdgeInsetsDirectional.fromSTEB(32, 0, 0, 16),
          child: Text(
            AppLocalizations.of(context).appTitle,
            style: themeData.textTheme.headline6.copyWith(
              color: themeData.colorScheme.onPrimary,
            ),
          ),
        ),
      )
          : null,
    );
  }
}

class ListDrawer extends StatefulWidget {
  @override
  _ListDrawerState createState() => _ListDrawerState();
}

class _ListDrawerState extends State<ListDrawer> {
  String currentRoute = '/home';
  int selectedItem;
  final numPages = 9;

  final List<String> _routes = [
    '/',
    '/settings'
  ];

  _setRoute(String route) {
    setState(() {
      currentRoute = route;
      Navigator.of(context).restorablePushNamed(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                AppLocalizations.of(context).appTitle,
                style: textTheme.headline5,
              ),
            ),
            const Divider(),
            ListTile(
              enabled: true,
              selected: '/home' == currentRoute,
              leading: const Icon(FontAwesomeIcons.home),
              title: Text(
                AppLocalizations.of(context).homeTitle,
              ),
              onTap: () {
                _setRoute('/home');
              },
            ),
            ListTile(
              enabled: true,
              selected: '/settings' == currentRoute,
              leading: const Icon(FontAwesomeIcons.cogs),
              title: Text(
                AppLocalizations.of(context).settingsTitle,
              ),
              onTap: () {
                _setRoute('/settings');
              },
            )
          ],
        ),
      ),
    );
  }
}

