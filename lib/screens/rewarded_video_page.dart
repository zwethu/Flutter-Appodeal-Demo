import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

class RewardedVideoPage extends StatefulWidget {
  const RewardedVideoPage({super.key});

  @override
  State<RewardedVideoPage> createState() => _RewardedVideoPageState();
}

class _RewardedVideoPageState extends State<RewardedVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Rewarded Video Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await Appodeal.isLoaded(AppodealAdType.RewardedVideo) &&
              await Appodeal.canShow(AppodealAdType.RewardedVideo)) {
            Appodeal.show(AppodealAdType.RewardedVideo);
          } else {
            log('Rewarded video ads is not ready.');
          }
        },
        child: const Icon(Icons.movie_filter_outlined),
      ),
    );
  }
}
