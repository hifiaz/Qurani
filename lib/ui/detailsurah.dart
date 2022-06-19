import 'package:alqurani/data/models/allsurah.dart';
import 'package:alqurani/data/services.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/data/utils/arabic_number.dart';
import 'package:alqurani/data/utils/style.dart';
import 'package:alqurani/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class DetailSurah extends StatefulWidget {
  final String? detail;
  final int index;
  DetailSurah({Key? key, this.detail, required this.index}) : super(key: key);

  @override
  _DetailSurahState createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  // late InterstitialAd _interstitialAd;
  late String title;

  @override
  void initState() {
    loadAds();
    title = widget.detail ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(title),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu_book),
            onPressed: () => ui.mode = !ui.mode,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          )
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder<AllSurah>(
            future: ServiceData().loadSurah(widget.index),
            builder: (c, snapshot) {
              List<TextSpan> listOfTextSpan = [];
              if (snapshot.hasData) {
                if (widget.detail?.isEmpty == true) {
                  if (mounted) {
                    setTitle(snapshot.data?.nameLatin ?? '');
                  }
                }
                for (int i = 0; i < snapshot.data!.text!.length; i++) {
                  listOfTextSpan.add(TextSpan(
                      text:
                          " ${snapshot.data!.text?[snapshot.data!.text!.keys.elementAt(i)]} \uFD3F${ArabicNumbers().convert(snapshot.data!.text!.keys.elementAt(i))}\uFD3E "));
                }
              }
              return snapshot.hasData
                  ? ui.mode
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.all(25.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontFamily: 'lpmq',
                                      fontSize: ui.fontSize,
                                      height: 2.5,
                                    ),
                                children: listOfTextSpan,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          itemCount: snapshot.data!.text!.length,
                          itemBuilder: (BuildContext c, int i) {
                            String key = snapshot.data!.text!.keys.elementAt(i);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    leading: Text(
                                      ArabicNumbers().convert(snapshot
                                          .data!.text!.keys
                                          .elementAt(i)),
                                    ),
                                    title: Text(
                                      '${snapshot.data!.text![key]}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: ui.fontSize,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                  if (ui.terjemahan)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        AppStyle.spaceH10,
                                        Text(
                                          'Terjemah',
                                          style: AppStyle.end2subtitle,
                                        ),
                                        AppStyle.spaceH5,
                                        Text(
                                          snapshot.data?.translations?.id
                                                  ?.text?[key] ??
                                              '',
                                          style: TextStyle(
                                            fontSize: ui.fontSizetext,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (ui.tafsir)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        AppStyle.spaceH10,
                                        Text(
                                          'Tafsir Kemenag',
                                          style: AppStyle.end2subtitle,
                                        ),
                                        AppStyle.spaceH5,
                                        Text(
                                          snapshot.data?.tafsir?.id?.kemenag
                                                  ?.text?[key] ??
                                              '',
                                          style: TextStyle(
                                            fontSize: ui.fontSizetext,
                                          ),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            );
                          })
                  : Center(child: CircularProgressIndicator());
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                if (widget.index != 1)
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailSurah(detail: '', index: widget.index - 1),
                        ),
                      );
                    },
                    icon: Icon(Icons.keyboard_arrow_left),
                  ),
                Spacer(),
                if (widget.index != 114)
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailSurah(
                                detail: '', index: widget.index + 1),
                          ),
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_right))
              ],
            ),
          )
        ],
      ),
    );
  }

  void setTitle(String titleSet) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        title = titleSet;
      });
    });
  }

  Future<void> loadAds() async {
    await InterstitialAd.load(
      adUnitId: dotenv.env['INTERSTIALID']!,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          // Keep a reference to the ad so you can show it later.
          // this._interstitialAd = ad;
          ad.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }
}
