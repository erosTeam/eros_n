import 'package:cached_network_image/cached_network_image.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/pages/user/user_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MorePage extends StatefulHookConsumerWidget {
  const MorePage({super.key});

  @override
  ConsumerState<MorePage> createState() => _MorePageState();
}

class _MorePageState extends ConsumerState<MorePage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  IndexNotifier get indexProviderNoti => ref.read(indexProvider.notifier);

  @override
  void initState() {
    super.initState();
    indexProviderNoti.addScrollController(scrollController);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(L10n.of(context).more),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Consumer(builder: (context, ref, child) {
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
                    title: Text(L10n.of(context).login),
                    onTap: () {
                      erosRouter.pushNamed(NHRoutes.login);
                    },
                  );
                } else {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      backgroundImage: user.avatarUrl != null
                          ? CachedNetworkImageProvider(user.avatarUrl ?? '')
                          : null,
                    ),
                    title: Text(user.userName ?? '...'),
                    onTap: () {
                      // dialog to logout
                      showDialog(
                          context: context,
                          builder: (context) {
                            logger.d('logout $user');
                            return AlertDialog(
                              title: Text(L10n.of(context).logout),
                              content: Text('Are you sure to logout?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(L10n.of(context).cancel),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(L10n.of(context).logout),
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
            ),
            const Divider(height: 1.0),
            ListTile(
              leading: const Icon(Icons.download_outlined),
              iconColor: Theme.of(context).colorScheme.primary,
              title: Text(L10n.of(context).download),
              onTap: () {
                // Navigator.pushNamed(context, '/download');
                // showDialog
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(L10n.of(context).download),
                        content: Text(
                            'Feature in development, currently unavailable'),
                        actions: <Widget>[
                          TextButton(
                            child: Text(L10n.of(context).ok),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
            const Divider(height: 1.0),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              iconColor: Theme.of(context).colorScheme.primary,
              title: Text(L10n.of(context).settings),
              onTap: () {
                erosRouter.pushNamed(NHRoutes.settings);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              iconColor: Theme.of(context).colorScheme.primary,
              title: Text(L10n.of(context).about),
              onTap: () {
                erosRouter.pushNamed(NHRoutes.about);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
