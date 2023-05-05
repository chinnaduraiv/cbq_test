import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cbq/constants/constants.dart';
import 'package:cbq/services/storage_service.dart';

class SettingNotifier extends StateNotifier<bool> {
  final StorageService storageService;

  SettingNotifier({required this.storageService}) : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    state = await storageService.getBoolValue(key: Constants.darkMode);
  }

  Future<void> changeTheme(bool isDarkTheme) async {
    state = isDarkTheme;
    await storageService.setBoolValue(
      key: Constants.darkMode,
      value: isDarkTheme,
    );
  }
}
