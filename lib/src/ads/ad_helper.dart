import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    // TODO 광고 ID 바꾸기
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // 테스트 광고 ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // 테스트 광고 ID
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    // TODO 광고 ID 바꾸기
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/7049598008'; // 테스트 광고 ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3964253750'; // 테스트 광고 ID
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    // TODO 광고 ID 바꾸기
    if (Platform.isAndroid) {
      return 'ca-app-pub-9245086971599023/3412781142';
      // return 'ca-app-pub-3940256099942544/5224354917'; // 테스트 광고 ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/7552160883'; // 테스트 광고 ID
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
