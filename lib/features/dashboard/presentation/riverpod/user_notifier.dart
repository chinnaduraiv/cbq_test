import 'package:cbq/exceptions/networking_exception.dart';
import 'package:cbq/features/dashboard/domain/usecases/user_use_case_impl.dart';
import 'package:cbq/features/dashboard/presentation/state/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserUseCase useCase;

  UserNotifier({required this.useCase}) : super(const UserInitial()) {
    getUsers();
  }

  Future<void> getUsers() async {
    try {
      state = const UserLoading();
      final albums = await useCase.getUsers();
      state = UserLoaded(users: albums, searchList: albums);
    } on NetworkException {
      state = const UserError('Couldnt fetch weather. Is the device online?');
    }
  }
}
