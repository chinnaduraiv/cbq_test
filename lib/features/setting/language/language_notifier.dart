import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cbq/constants/constants.dart';
import 'package:cbq/services/storage_service.dart';

class LanguageNotifier extends StateNotifier<bool> {
  final StorageService storageService;

  LanguageNotifier({required this.storageService}) : super(false) {
    loadLanguageCode();
  }

  Future<void> loadLanguageCode() async {
    state = await storageService.getBoolValue(key: Constants.languageCode);
  }

  Future<void> changeLanguage(bool isEnglish) async {
    state = isEnglish;
    await storageService.setBoolValue(
      key: Constants.languageCode,
      value: isEnglish,
    );
  }
}
