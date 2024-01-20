import 'package:flutter_auth/Classes/card_model_for_all.dart';

class WatchVideosModel extends CardModelForAll {
  WatchVideosModel(
      {required String image,
      required String title,
      required String subtitle,
      required int coin,
      String? routeName})
      : super(
            image: image,
            title: title,
            subtitle: subtitle,
            coin: coin,
            routeName: routeName);
}

class GamesCardModel extends CardModelForAll {
  GamesCardModel(
      {required String image,
      required String title,
      required String subtitle,
      required int coin,
      String? routeName})
      : super(
            image: image,
            title: title,
            subtitle: subtitle,
            coin: coin,
            routeName: routeName);
}

class VisitCardModel extends CardModelForAll {
    final String buttonKey;
    final String initialUrl;
    final String destinationUrl;
    VisitCardModel(
      {
        required String image,
        required this.initialUrl,
        required this.destinationUrl,
      required String title,
      required String subtitle,
      required int coin,
          required this.buttonKey,
      String? routeName})
      : super(
            image: image,
            title: title,
            subtitle: subtitle,
            coin: coin,

            routeName: routeName);
}

class HotNowCardModel extends CardModelForAll {
  HotNowCardModel(
      {required String image,
      required String title,
      required String subtitle,
      required int coin,
      String? routeName})
      : super(
            image: image,
            title: title,
            subtitle: subtitle,
            coin: coin,
            routeName: routeName);
}
