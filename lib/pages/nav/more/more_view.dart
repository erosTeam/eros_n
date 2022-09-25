import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child:  Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
            const Divider(
              thickness: 1.0,
            ),
            ListTile(
              leading: const Icon(Icons.download_outlined),
              iconColor: Theme.of(context).colorScheme.primary,
              title: Text('Download'),
              onTap: () {
                Navigator.pushNamed(context, '/download');
              },
            ),
            const Divider(
              thickness: 1.0,
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              iconColor: Theme.of(context).colorScheme.primary,
              title: Text('Settings'),
              onTap: () {
                erosRouter.pushNamed(NHRoutes.settings);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              iconColor: Theme.of(context).colorScheme.primary,
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
