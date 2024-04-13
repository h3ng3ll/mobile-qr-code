

// import 'package:admob_flutter/admob_flutter.dart';

// class AdMobService {
//
//   static  const interstitialAdUnitId = "";
//   static  const getBannerAdUnitId = "";
//   static  const getRewardBasedVideoAdUnitId = "";
//
//   static AdmobInterstitial interstitialAd = AdmobInterstitial(
//       adUnitId: interstitialAdUnitId,
//       listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
//         if (event == AdmobAdEvent.closed) interstitialAd.load();
//       },
//   );
//
//   static AdmobReward rewardAd = AdmobReward(
//     adUnitId: getRewardBasedVideoAdUnitId,
//     listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
//       if (event == AdmobAdEvent.closed) interstitialAd.load();
//     },
//   );
//
//   static AdmobBanner admobBanner (AdmobBannerSize size) => AdmobBanner(
//       adUnitId: getBannerAdUnitId,
//       adSize: size,
//       listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
//         if (event == AdmobAdEvent.closed) interstitialAd.load();
//       },
//   );
// }