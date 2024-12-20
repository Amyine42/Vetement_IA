class Category {
  final String id;
  final String name;
  final int itemCount;
  final String exampleImageUrl;
  final String exampleBrand;
  final int createdAt;
  final int lastUpdated;

  Category({
    required this.id,
    required this.name,
    required this.itemCount,
    required this.exampleImageUrl,
    required this.exampleBrand,
    required this.createdAt,
    required this.lastUpdated,
  });

  factory Category.fromMap(String id, Map<dynamic, dynamic> map) {
    return Category(
      id: id,
      name: map['name'] ?? '',
      itemCount: map['itemCount'] ?? 0,
      exampleImageUrl: map['exampleImageUrl'] ?? '',
      exampleBrand: map['exampleBrand'] ?? '',
      createdAt: map['createdAt'] ?? 0,
      lastUpdated: map['lastUpdated'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'itemCount': itemCount,
      'exampleImageUrl': exampleImageUrl,
      'exampleBrand': exampleBrand,
      'createdAt': createdAt,
      'lastUpdated': lastUpdated,
    };
  }
}