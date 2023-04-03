class Register {
  String name;
  String email;
  String nick;
  String password;
  String password_confirmation;

  Register(
      {this.name = '',
      this.email = '',
      this.nick = '',
      this.password = '',
      this.password_confirmation = ''});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "nick": nick,
        "password": password,
        "password_confirmation": password_confirmation,
      };
}
