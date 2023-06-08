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
    final Uri toProfile = Uri(
        scheme: 'https',
        host: 'github.com',
        path: '/shubhamgitvns');

    final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'github.com',
        path: '/shubhamgitvns/myapp');


    return Center(
      child: Column(

        children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 500,
                  child: Text("My Git Profile Link",
                    style: TextStyle(fontSize: 30,color: Colors.amber,),),
                ),
              ),

              SizedBox(

                height: 50,
                child: ElevatedButton(
                  // style: style,
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toProfile);
                  }),
                  child: const Text('Click in browser'),
                ),
              ),

            ],

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 500,
                  child: Text("My App Git File Link",
                    style: TextStyle(fontSize: 30,color: Colors.amber),),
                ),
              ),

              SizedBox(

                height: 50,
                child: ElevatedButton(
                  // style: style,
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toLaunch);
                  }),
                  child: const Text('Click in browser'),
                ),
              ),

            ],

          )

        ],
      ),
    );
  }
}
