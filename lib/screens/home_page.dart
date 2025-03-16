import 'package:flutter/material.dart';
import 'package:flutter_appodeal_trial/screens/banner_page.dart';
import 'package:flutter_appodeal_trial/screens/interstitial_page.dart';
import 'package:flutter_appodeal_trial/screens/mrec_page.dart';
import 'package:flutter_appodeal_trial/screens/rewarded_video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BannerPage(),
                  ),
                );
              },
              child: const Text('Banner Page'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InterstitialPage(),
                  ),
                );
              },
              child: const Text('Interstitial Page'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MrecPage(),
                  ),
                );
              },
              child: const Text('MREC Page'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RewardedVideoPage(),
                  ),
                );
              },
              child: const Text('Rewarded Video Page'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
