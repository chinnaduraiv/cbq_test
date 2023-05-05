import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';

abstract class UserRepository {
  Future<List<UserEntityModel>> getUsers();
}
