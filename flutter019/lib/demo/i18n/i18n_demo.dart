import 'package:flutter/material.dart';
import 'package:flutter019/demo/i18n/map/localizations.dart';


class I18nDemo extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              DemoLocalizations.of(context).title,
              // Localizations.of(context, DemoLocalizations).title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}