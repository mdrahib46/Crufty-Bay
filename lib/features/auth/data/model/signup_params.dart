class SignUpParams {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String mobile;
  final String city;

  SignUpParams(
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.mobile,
    this.city,
  );

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": mobile,
      "city": city,
    };
  }
}
