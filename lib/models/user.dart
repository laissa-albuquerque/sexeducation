class UserModel {
  final String id;
  final String name;
  final String nickname;
  final String email;
  final String password;
  final String dateOfBirth;

  UserModel({
    this.id = "",
    required this.name,
    this.nickname = "",
    required this.email,
    required this.password,
    required this.dateOfBirth
  });

  UserModel copyWith({String? name, String? email, String? password, String? dateOfBirth }) {
    return UserModel(name: name ?? this.name, email: email ?? this.email,
        password: password ?? this.password, dateOfBirth: dateOfBirth ?? this.dateOfBirth);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], nickname: map['nickname'], email: map['email'], password: map['password'], dateOfBirth: map['dateOfBirth']);
  }

  Map<String, dynamic> toMap()=> {
    'name': name,
    'nickname': nickname,
    'email': email,
    'password': password,
    'dateOfBirth': dateOfBirth
  };

}