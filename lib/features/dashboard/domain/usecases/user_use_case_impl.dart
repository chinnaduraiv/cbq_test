import 'package:cbq/dependency_injector/dependency_injector.dart';
import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';
import 'package:cbq/features/dashboard/domain/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserUseCase {
  Future<List<UserEntityModel>> getUsers();
}

class UserUseCaseImpl implements UserUseCase {
  final UserRepository repository;
  ProviderRef? ref;

  UserUseCaseImpl({required this.repository, this.ref});

  @override
  Future<List<UserEntityModel>> getUsers() async {
    List<UserEntityModel> dataList = await repository.getUsers();
    ref!.read(parentListProvider.notifier).update((state) => dataList);
    return dataList;
  }
}
