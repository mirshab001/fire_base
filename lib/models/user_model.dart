class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phone});

  //convert json to dart(map)

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
