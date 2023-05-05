
import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<UserEntityModel> users;
  final List<UserEntityModel> searchList;

  UserLoaded({required this.users, required this.searchList});
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);
}
