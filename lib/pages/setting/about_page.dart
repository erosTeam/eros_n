import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.about)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(l10n.version),
              subtitle: Text(
                '${Global.packageInfo.version} (${Global.packageInfo.buildNumber})',
              ),
            ),
            ListTile(
              title: Text(l10n.author),
              subtitle: const Text('erosTeam'),
              onTap: () => launchUrlString(
                'https://github.com/erosTeam',
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              title: const Text('Github'),
              subtitle: const Text('https://github.com/erosTeam/eros_n'),
              onTap: () => launchUrlString(
                'https://github.com/erosTeam/eros_n',
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              title: Text(l10n.license),
              onTap: () {
                erosRouter.push(const MyLicenseRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
