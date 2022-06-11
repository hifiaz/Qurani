import 'package:alqurani/data/models/surahinfo.dart';
import 'package:alqurani/data/services.dart';
import 'package:alqurani/data/utils/constan.dart';
import 'package:alqurani/ui/detailsurah.dart';
import 'package:alqurani/ui/widget/cardsurah.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

class ListAlquran extends StatefulWidget {
  @override
  _ListAlquranState createState() => _ListAlquranState();
}

class _ListAlquranState extends State<ListAlquran> {
  InterstitialAd _interstitialAd;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurahInfo>>(
      future: ServiceData().loadInfo(),
      builder: (c, snapshot) {
        return snapshot.hasData
            ? ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: snapshot.data
                    .map((data) => CardSurah(
                          title: data.latin,
                          subtitle: data.translation,
                          surah: data.index.toString(),
                          ayah: data.ayahCount.toString(),
                          arabic: data.arabic.toString(),
                          onTap: () {
                            loadAds()
                                .whenComplete(() => _interstitialAd?.show());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSurah(
                                        detail: data.latin,
                                        index: data.index)));
                          },
                        ))
                    .toList())
            : PKCardListSkeleton(
                isCircularImage: true,
                isBottomLinesActive: true,
                length: 10,
              );
      },
    );
  }

  Future<void> loadAds() async {
    await InterstitialAd.load(
      adUnitId: interestId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Keep a reference to the ad so you can show it later.
          this._interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }
}
