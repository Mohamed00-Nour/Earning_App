class VisitCardModel {
  final String image;
  final String title;
  final String subtitle;
  final int coin;
  final String? routeName;

  VisitCardModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.coin,
    this.routeName,
  });
}