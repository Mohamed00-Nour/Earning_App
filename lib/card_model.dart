class CardModel {
  final String text;
  final String image;
  final bool showIcon;
  final double imageWidth;
  final double imageHeight;
  final String? routeName;

  CardModel({
    required this.text,
    required this.image,
    this.showIcon = false,
   required this.imageWidth, // default width
   required this.imageHeight,
    this.routeName,
  });
}
