class LoginRequest {
  String username;
  String password;

  LoginRequest(
    this.username,
    this.password,
  );
}
class RegisterRequest {
  String username;
  String name;
  String phone;
  String birthdate;
  String password;
  String confirmPassword;

  RegisterRequest(
    this.username,
    this.name,
    this.phone,
    this.birthdate,
    this.password,
    this.confirmPassword,
  );
}
