import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Version'),
              subtitle: Text(
                  '${Global.packageInfo.version} (${Global.packageInfo.buildNumber})'),
            ),
            ListTile(
              title: Text('Author'),
              subtitle: Text('Honjow'),
              onTap: () => launchUrlString(
                'https://github.com/honjow',
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('honjow311@gmail.com'),
              onTap: () => launchUrlString('mailto:honjow311@gmail.com'),
            ),
            ListTile(
              title: Text('Github'),
              subtitle: Text('https://github.com/erosTeam/eros_n'),
              onTap: () => launchUrlString(
                'https://github.com/erosTeam/eros_n',
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              title: Text('Telegram'),
              onTap: () => launchUrlString(
                'https://t.me/joinchat/AEj27KMQe0JiMmUx',
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              title: Text('Telegram Channel'),
              onTap: () => launchUrlString(
                'https://t.me/fehviewer',
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              title: Text('License'),
              onTap: () {
                erosRouter.pushNamed(NHRoutes.license);
              },
            ),
          ],
        ),
      ),
    );
  }
}
