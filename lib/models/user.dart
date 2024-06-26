class UserModel {
  final String id;
  final String name;
  final String nickname;
  final String email;
  final String avatar;

  UserModel({
    this.id = "",
    required this.name,
    this.nickname = "",
    required this.email,
    // required this.dateOfBirth,
    this.avatar = ""
  });

  UserModel copyWith({String? name, String? email, String? password, String? dateOfBirth }) {
    return UserModel(name: name ?? this.name, email: email ?? this.email);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], nickname: map['nickname'], email: map['email']);
  }

  Map<String, dynamic> toMap()=> {
    'name': name,
    'nickname': nickname,
    'email': email,
  };

}