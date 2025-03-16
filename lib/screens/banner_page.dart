import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBannerAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
        if (index == 6) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3),
            ),
            child: const AppodealBanner(adSize: AppodealBannerSize.BANNER),
          );
        }
        return ListTile(
          title: Text('title$index'),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Appodeal.hide(AppodealAdType.Banner);
          // Appodeal.hide(AppodealAdType.BannerBottom);
          // Appodeal.hide(AppodealAdType.BannerLeft);
          // Appodeal.hide(AppodealAdType.BannerTop);
          // Appodeal.hide(AppodealAdType.BannerRight);
        },
        child: const Icon(Icons.movie_filter_outlined),
      ),
    );
  }
}

Future<void> loadBannerAds() async {
  if (await Appodeal.canShow(AppodealAdType.BannerLeft) &&
      await Appodeal.isLoaded(AppodealAdType.BannerLeft)) {
    Appodeal.show(AppodealAdType.BannerLeft);
    log('Banner left is not ready.');
  }

  if (await Appodeal.canShow(AppodealAdType.BannerTop) &&
      await Appodeal.isLoaded(AppodealAdType.BannerTop)) {
    Appodeal.show(AppodealAdType.BannerTop);
    log('Banner Top is not ready.');
  }

  if (await Appodeal.canShow(AppodealAdType.BannerRight) &&
      await Appodeal.isLoaded(AppodealAdType.BannerRight)) {
    Appodeal.show(AppodealAdType.BannerRight);
    log('Banner right is not ready.');
  }

  if (await Appodeal.canShow(AppodealAdType.BannerBottom) &&
      await Appodeal.isLoaded(AppodealAdType.BannerBottom)) {
    Appodeal.show(AppodealAdType.BannerBottom);
    log('Banner Bottom is not ready.');
  }
}
