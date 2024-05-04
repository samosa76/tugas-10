class Flower {
  String id;
  final String flowerName;
  final String flowerImages;

  Flower({
    this.id = "",
    required this.flowerName,
    required this.flowerImages,
  });

  factory Flower.fromJson(Map<String, dynamic> json) {
    return Flower(
      id: json['id'] as String,
      flowerName: json['name'] as String,
      flowerImages: json['image'] as String,
    );
  }
}
