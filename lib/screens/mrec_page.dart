import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

class MrecPage extends StatefulWidget {
  const MrecPage({super.key});

  @override
  State<MrecPage> createState() => _MrecPageState();
}

class _MrecPageState extends State<MrecPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: SizedBox(
          width: 300, // MREC Ad size
          height: 250, // MREC Ad size
          child: AppodealBanner(
              adSize: AppodealBannerSize
                  .MEDIUM_RECTANGLE), // Placeholder for layout
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await Appodeal.isLoaded(AppodealAdType.MREC) &&
              await Appodeal.canShow(AppodealAdType.MREC)) {
            Appodeal.show(AppodealAdType.MREC);
          } else {
            log('MREC ads is not ready.');
          }
        },
        child: const Icon(Icons.movie_filter_outlined),
      ),
    );
  }
}
