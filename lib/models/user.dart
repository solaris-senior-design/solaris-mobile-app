class User {
  final int id;
  final String _fullName;
  final String _username;
  final String _email;
  final String _password;
  final DateTime _createdAt;
  final DateTime _updatedAt;

  User(this.id, this._fullName, this._username, this._email, this._password,
      this._createdAt, this._updatedAt);

  factory User.fromJson(Map<String, dynamic> json) {
    DateTime createdAt = DateTime.parse(json['createdAt']);
    DateTime updatedAt = DateTime.parse(json['updatedAt']);
    return User(json['userId'], json['fullName'], json['username'],
        json['email'], json['password'], createdAt, updatedAt);
  }

  String get fullName {
    return _fullName;
  }

  String get username {
    return _username;
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  DateTime get createdAt {
    return _createdAt;
  }

  DateTime get updatedAt {
    return _updatedAt;
  }
}
