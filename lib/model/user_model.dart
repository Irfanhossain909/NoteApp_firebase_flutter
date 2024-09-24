class UserModel {
  String name;
  String uid;
  String email;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {return {
    'name': name,
    'uid': uid,
    'email': email,
  };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
    );
  }


}
