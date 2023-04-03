
class RegisterResponse {
    String? message;
    Data? data;

    RegisterResponse({this.message, this.data});

    RegisterResponse.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    String? name;
    String? email;
    String? nick;
    String? updatedAt;
    String? createdAt;
    int? id;

    Data({this.name, this.email, this.nick, this.updatedAt, this.createdAt, this.id});

    Data.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        email = json["email"];
        nick = json["nick"];
        updatedAt = json["updated_at"];
        createdAt = json["created_at"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["email"] = email;
        _data["nick"] = nick;
        _data["updated_at"] = updatedAt;
        _data["created_at"] = createdAt;
        _data["id"] = id;
        return _data;
    }
}