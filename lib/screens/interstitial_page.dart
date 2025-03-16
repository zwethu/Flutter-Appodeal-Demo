import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

class InterstitialPage extends StatefulWidget {
  const InterstitialPage({super.key});

  @override
  State<InterstitialPage> createState() => _InterstitialPageState();
}

class _InterstitialPageState extends State<InterstitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Interstitial Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await Appodeal.isLoaded(AppodealAdType.Interstitial) &&
              await Appodeal.canShow(AppodealAdType.Interstitial)) {
            Appodeal.show(AppodealAdType.Interstitial);
          } else {
            log('Interstitial ads is not ready.');
          }
        },
        child: const Icon(Icons.movie_filter_outlined),
      ),
    );
  }
}
