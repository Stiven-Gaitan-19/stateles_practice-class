class LoginResponse {
  String? message;
  Data? data;

  LoginResponse({this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? nick;
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;
  String? token;

  Data(
      {this.id,
      this.name,
      this.email,
      this.nick,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    nick = json["nick"];
    rememberToken = json["remember_token"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["nick"] = nick;
    _data["remember_token"] = rememberToken;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["token"] = token;
    return _data;
  }
}
