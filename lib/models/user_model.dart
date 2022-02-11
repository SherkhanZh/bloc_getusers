class User {
  User(this.id, this.name, this.email, this.phone);
  final int id;
  final String name;
  final String? email;
  final String? phone;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['id'], json['name'], json['email'] ?? ' ', json['phone'] ?? ' ');
  }
}
