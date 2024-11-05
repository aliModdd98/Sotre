class UserModel {
  String? userId;
  String? userEmail;
  String? userToken;

  UserModel({
    this.userId,
    this.userEmail,
    this.userToken,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['id'];
    userEmail = json['email'];
    userToken = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = userId;
    data['email'] = userEmail;
    data['token'] = userToken;
    return data;
  }
}
