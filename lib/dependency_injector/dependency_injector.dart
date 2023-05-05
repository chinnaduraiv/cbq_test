import 'package:cbq/features/dashboard/data/datasources/user_data_source.dart';
import 'package:cbq/features/dashboard/data/datasources/user_data_source_impl.dart';
import 'package:cbq/features/dashboard/data/repositories/user_repository_impl.dart';
import 'package:cbq/features/dashboard/domain/entities/user_entity_model.dart';
import 'package:cbq/features/dashboard/domain/repositories/user_repository.dart';
import 'package:cbq/features/dashboard/domain/usecases/user_use_case_impl.dart';
import 'package:cbq/features/dashboard/presentation/riverpod/user_notifier.dart';
import 'package:cbq/features/dashboard/presentation/state/user_state.dart';
import 'package:cbq/features/setting/language/language_notifier.dart';
import 'package:cbq/features/setting/setting_notifier.dart';
import 'package:cbq/services/conectivity_services.dart';
import 'package:cbq/services/http_service.dart';
import 'package:cbq/services/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageServiceImpl();
});

final httpServiceProvider = Provider<HttpService>((ref) {
  return HttpServiceImpl();
});

final userDatasourceProvider = Provider<UserDataSource>((ref) {
  return UserDataSourceImpl(httpService: ref.watch(httpServiceProvider));
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(dataSource: ref.watch(userDatasourceProvider));
});

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(
      repository: ref.watch(userRepositoryProvider), ref: ref);
});

final settingNotifierProvider =
    StateNotifierProvider<SettingNotifier, bool>((ref) {
  return SettingNotifier(storageService: ref.watch(storageServiceProvider));
});

final languageNotifierProvider =
    StateNotifierProvider<LanguageNotifier, bool>((ref) {
  return LanguageNotifier(storageService: ref.watch(storageServiceProvider));
});

final parentListProvider = StateProvider<List<UserEntityModel>>((ref) {
  return [];
});

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(useCase: ref.watch(userUseCaseProvider));
});

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});
