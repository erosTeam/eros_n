import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/user/user_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
            Consumer(builder: (context, ref, child) {
              final user = ref.watch(userProvider);
              if (!user.isLogin) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  title: Text('Login'),
                  onTap: () {
                    erosRouter.pushNamed(NHRoutes.login);
                  },
                );
              } else {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundImage:
                        CachedNetworkImageProvider(user.avatarUrl ?? ''),
                  ),
                  title: Text(user.userName ?? ''),
                  onTap: () {
                    // dialog to logout
                    showDialog(
                        context: context,
                        builder: (context) {
                          logger.d('logout $user');
                          return AlertDialog(
                            title: Text('Logout'),
                            content: Text('Are you sure to logout?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Logout'),
                                onPressed: () {
                                  ref.read(userProvider.notifier).logout();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                );
              }
            }),
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
                erosRouter.pushNamed(NHRoutes.about);
              },
            ),
          ],
        ),
      ),
    );
  }
}
