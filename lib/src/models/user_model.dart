class UserModel {
  UserModel({this.id, this.email, this.password});
  String? id;
  String? email;
  String? password;

  String get name {
    String name = '';

    name = email!.split('@').first;

    if (name.contains('.')) {
      name = name.split('.').join(' ');
    }

    name = name.toUpperCase();

    return name;
  }

  UserModel.fromDatabase(Map<String, dynamic> data) {
    id = data["id"].toString();
    email = data["email"];
    password = data["password"];
  }

  @override
  String toString() {
    return 'UserModel{id=$id, email=$email, password=$password}';
  }
}
