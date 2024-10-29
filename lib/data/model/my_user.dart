class MyUser {
  static const String collectionName="MyUser";
  String id;
  String userName;
  String email;

  MyUser({required this.id, required this.userName, required this.email});

  MyUser.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          userName: json['userName'] as String,
          email: json['email'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
    };
  }
}
