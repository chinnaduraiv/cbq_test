import 'package:cbq/features/dashboard/data/datasources/user_data_source.dart';
import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';
import 'package:cbq/features/dashboard/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl({required this.dataSource});

  @override
  Future<List<UserEntityModel>> getUsers() async {
    return await dataSource.getUsers();
  }
}
