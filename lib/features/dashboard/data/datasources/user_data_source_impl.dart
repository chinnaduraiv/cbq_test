import 'dart:convert';
import 'dart:developer';

import 'package:cbq/environments/environments.dart';
import 'package:cbq/features/dashboard/data/datasources/user_data_source.dart';
import 'package:cbq/features/dashboard/data/models/user_model.dart';
import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';
import 'package:cbq/services/http_service.dart';

class UserDataSourceImpl implements UserDataSource {
  final List<UserEntityModel> _listOfUsers = [];

  final HttpService httpService;

  UserDataSourceImpl({required this.httpService});

  @override
  Future<List<UserEntityModel>> getUsers() async {
    try {
      await httpService
          .getData(
        uri: Uri.https(Environments.baseURL, Environments.users),
      )
          .then((value) {
        _listOfUsers.addAll(
            UserModel.jsonToList(jsonDecode(value.body) as List<dynamic>));
        return _listOfUsers;
      });
    } catch (e) {
      log('$e');
    }
    return _listOfUsers;
  }
}
