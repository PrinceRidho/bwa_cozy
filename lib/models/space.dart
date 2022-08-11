class Space {
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;

  Space({
    required this.city,
    required this.country,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.id,
  });
}
