import 'dart:math';

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
      child: Column(

        children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(0.0),
                child: Text("My Profile Link"),
              ),

              ElevatedButton(
                // style: style,
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch);
                }),
                child: const SizedBox(child: Text(' in browser'),
                  height: 20,),
              ),

            ],

          )

        ],
      ),
    );
  }
}
