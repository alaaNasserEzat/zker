class NameAllah {
  final int id;
  final String name;
  final String description;

  NameAllah({
    required this.id,
    required this.name,
    required this.description,
  });
  factory NameAllah.fromJson(Map<String, dynamic> json) {
    return NameAllah(
      id: json['id'],
      name: json['name'],
      description: json['text'],
    );
  }
}