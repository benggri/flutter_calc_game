import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_calc_game/src/ads/preloaded_banner_ad.dart';
import 'package:flutter_calc_game/src/ads/ad_helper.dart';

class AdsController {
  final MobileAds _instance;

  PreloadedBannerAd? _preloadedAd;

  AdsController(MobileAds instance) : _instance = instance;

  void dispose() {
    _preloadedAd?.dispose();
  }

  Future<void> initialize() async {
    await _instance.initialize();
  }

  void preloadAd() {
    final adUnitId = AdHelper.bannerAdUnitId;
    _preloadedAd = PreloadedBannerAd(size: AdSize.mediumRectangle, adUnitId: adUnitId);

    Future<void>.delayed(const Duration(seconds: 1)).then((_) {
      return _preloadedAd!.load();
    });
  }

  PreloadedBannerAd? takePreloadedAd() {
    final ad = _preloadedAd;
    _preloadedAd = null;
    return ad;
  }

}