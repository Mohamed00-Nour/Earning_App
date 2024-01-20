abstract class CardModelForAll {
  String image;
  String title;
  String subtitle;
  int coin;
  String? routeName;
  String? text;
  double? imageWidth;
  double? imageHeight;

  CardModelForAll({required this.image, required this.title, required this.subtitle, required this.coin, this.routeName, this.text, this.imageWidth, this.imageHeight});
}