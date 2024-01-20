class WatchVideosModel {
  final String image;
  final String title;
  final String subtitle;
  final int coin;
  final String? routeName;

  WatchVideosModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.coin,
    this.routeName,
  });
}