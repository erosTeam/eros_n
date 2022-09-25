import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(Icons.color_lens_outlined),
              title: Text('Appearance'),
              onTap: () {
                erosRouter.pushNamed(NHRoutes.appearanceSetting);
              },
            ),
          ],
        ));
  }
}
