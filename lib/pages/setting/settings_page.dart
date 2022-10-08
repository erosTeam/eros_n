import 'package:eros_n/common/global.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context).settings),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(Icons.color_lens_outlined),
              title: Text(L10n.of(context).appearance),
              onTap: () {
                erosRouter.pushNamed(NHRoutes.appearanceSetting);
              },
            ),


            if(kDebugMode) ListTile(
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(Icons.cookie_outlined),
              title: Text('清理COOKIE'),
              onTap: () {
                Global.cookieJar.deleteAll();
              },
            ),

          ],
        ));
  }
}
