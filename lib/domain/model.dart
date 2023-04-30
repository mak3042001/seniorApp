//loginModel
class Data {
  User? user;
  String token;

  Data(
    this.user,
    this.token,
  );
}

class User {
  int id;
  String username;
  String name;
  String email;
  String phone;
  String birthdate;
  int age;
  String image;

  User(
    this.id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.birthdate,
    this.age,
    this.image,
  );
}

class Auth {
  Data? data;

  Auth(
    this.data,
  );
}
