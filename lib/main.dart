import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_appodeal_trial/screens/home_page.dart';
import 'package:flutter_appodeal_trial/utils/app_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializeAppodeal();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      home: const HomePage(),
    );
  }
}

Future<void> initializeAppodeal() async {
  // getting appodeal key from .env
  await dotenv.load();
  String appodealAppKey = dotenv.env['APPODEAL_APP_KEY'] ?? 'Empty Key';

  // Appodeal general configuration
  // Set auto caching enabled for all types
  Appodeal.setAutoCache(AppodealAdType.Interstitial, true);
  Appodeal.setAutoCache(AppodealAdType.Banner, true);
  Appodeal.setAutoCache(AppodealAdType.MREC, true);
  Appodeal.setAutoCache(AppodealAdType.RewardedVideo, true);

// Set testing mode for the SDK
  Appodeal.setTesting(false);

// Set the logging level for the SDK
  Appodeal.setLogLevel(Appodeal.LogLevelVerbose); // Enable verbose logging

// Enable or disable child-directed treatment (for COPPA compliance)
  Appodeal.setChildDirectedTreatment(
      false); // Don't treat app as child-directed

  Appodeal.setAdViewAutoResume(true); // Enable auto-resume for banner ads
  Appodeal.muteVideosIfCallsMuted(true); // Mute videos if the user is on a call

  // Enable or disable tablet banners.
  // SUPPORTED ONLY FOR NON-VIEW DISPLAYING
  // THIS METHOD DOES NOT WORK CORRECTLY FOR BANNER VIEW BECAUSE BANNER VIEW DOES NOT SUPPORT TABLET FORMAT
  Appodeal.setTabletBanners(true); //default - false

  // Enable or disable smart banners.
  // SUPPORTED ONLY FOR NON-VIEW DISPLAYING
  // iOS smart banners are supported only for applications where autorotation is disabled
  Appodeal.setSmartBanners(true); //default - false

// Enable or disable banner refresh animation
  Appodeal.setBannerAnimation(true); //default - true

  // get info about how much revenue made from an ads
  Appodeal.setAdRevenueCallbacks(onAdRevenueReceive: (adRevenue) {
    // Example of logging revenue info
    log("Ad Revenue: ${adRevenue.revenue} ${adRevenue.currency}");
    log("Ad Type: ${adRevenue.adType}");
    log("Ad Network: ${adRevenue.networkName}");
  });

  // init appodeal and select all ads types
  await Appodeal.initialize(
    appKey: appodealAppKey,
    adTypes: [
      AppodealAdType.Interstitial,
      AppodealAdType.RewardedVideo,
      AppodealAdType.Banner,
      AppodealAdType.MREC,
      AppodealAdType.NativeAd,
    ],
    onInitializationFinished: (errors) {
      log('Appodeal Init Error occurred.');
      if (errors != null) {
        for (ApdInitializationError error in errors) {
          log("error: ${error.description}");
        }
      }
    },
  );
}
