import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void>? _launched;
  @override
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'github.com',
        path: '/shubhamgitvns');
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          const Padding(
            
            padding: EdgeInsets.all(16.0),
            child: Text("My Profile Link"),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              _launched = _launchInBrowser(toLaunch);
            }),
            child: const Text('Launch in browser'),
          ),
        ],
      ),
    );
  }
}
