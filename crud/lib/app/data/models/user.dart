class User {
  String id;
  String name;
  String cnic;
  String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.cnic,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      cnic: json['cnic'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cnic': cnic,
      'imageUrl': imageUrl,
    };
  }
}
