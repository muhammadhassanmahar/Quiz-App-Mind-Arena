class UserModel {

  final String id;
  final String name;
  final String email;
  final int wallet;
  final String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.wallet,
    required this.role,
  });

  // JSON → Model
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      wallet: json["wallet"] ?? 0,
      role: json["role"] ?? "user",
    );
  }

  // Model → JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "email": email,
      "wallet": wallet,
      "role": role,
    };
  }
}