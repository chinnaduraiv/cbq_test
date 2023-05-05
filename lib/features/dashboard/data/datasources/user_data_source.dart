import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';

abstract class UserDataSource {
  Future<List<UserEntityModel>> getUsers();
}
