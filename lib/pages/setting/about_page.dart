import 'package:eros_n/common/global.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:flutter/material.dart';

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
              subtitle: Text('1.0.0'),
            ),
            ListTile(
              title: Text('Author'),
              subtitle: Text('Honjow'),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('honjow311@gmail.com'),
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
