abstract class User {
  int id;
  String name;
  String email;
  String createdAt;
  String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });
}
