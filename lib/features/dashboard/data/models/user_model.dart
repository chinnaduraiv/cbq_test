import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';

class UserModel extends UserEntityModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;
    return data;
  }

  static List<UserModel> jsonToList(List<dynamic> data) {
    return data.map((items) => UserModel.fromJson(items)).toList();
  }
}
