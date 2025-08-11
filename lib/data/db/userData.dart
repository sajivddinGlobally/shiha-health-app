import 'dart:developer';


import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const _encryptionKey = 'qL9mX8vD3eRw1ZtP6oFbAsNcGyUhKjEx'; 

  // Private constructor for singleton
  HiveService._privateConstructor();
  static final HiveService _instance = HiveService._privateConstructor();
  factory HiveService() => _instance;

  // Track initialized boxes
  final Set<String> _initializedBoxes = {};

  /// Initializes Hive and opens a box with optional encryption
  Future<void> init(String boxName, {bool encrypted = false}) async {
    try {
      if (!Hive.isAdapterRegistered(0)) {
        await Hive.initFlutter();
      }

      if (!_initializedBoxes.contains(boxName)) {
        if (encrypted) {
          if (!Hive.isBoxOpen(boxName)) {
            await Hive.openBox(
              boxName,
              encryptionCipher: HiveAesCipher(_encryptionKey.codeUnits),
            );
          }
        } else {
          if (!Hive.isBoxOpen(boxName)) {
            await Hive.openBox(boxName);
          }
        }
        _initializedBoxes.add(boxName);
      }
    } catch (e, stackTrace) {
      log('Failed to initialize box $boxName', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Saves data with type safety checks
  Future<void> saveData<T>({
    required String key,
    required T data,
    required String boxName,
  }) async {
    try {
      await init(boxName);
      final box = Hive.box(boxName);
      await box.put(key, data);
    } catch (e, stackTrace) {
      log('Error saving data to $boxName', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves data with type safety
  T? getData<T>({
    required String key,
    required String boxName,
    T? defaultValue,
  }) {
    try {
      final box = Hive.box(boxName);
      final data = box.get(key, defaultValue: defaultValue);
      return data as T?;
    } catch (e, stackTrace) {
      log('Error reading data from $boxName', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Deletes data from a box
  Future<void> deleteData({
    required String key,
    required String boxName,
  }) async {
    try {
      final box = Hive.box(boxName);
      await box.delete(key);
    } catch (e, stackTrace) {
      log('Error deleting data from $boxName', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Gets all keys from a box
  List<String> getAllKeys(String boxName) {
    try {
      final box = Hive.box(boxName);
      return box.keys.cast<String>().toList();
    } catch (e, stackTrace) {
      log('Error getting keys from $boxName', error: e, stackTrace: stackTrace);
      return [];
    }
  }

  /// Clears all data from a box
  Future<void> clearAll(String boxName) async {
    try {
      final box = Hive.box(boxName);
      await box.clear();
    } catch (e, stackTrace) {
      log('Error clearing box $boxName', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Closes all open boxes
  Future<void> closeAllBoxes() async {
    try {
      await Hive.close();
      _initializedBoxes.clear();
    } catch (e, stackTrace) {
      log('Error closing boxes', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Deletes a box from disk
  Future<void> deleteBoxFromDisk(String boxName) async {
    try {
      await Hive.deleteBoxFromDisk(boxName);
      _initializedBoxes.remove(boxName);
    } catch (e, stackTrace) {
      log('Error deleting box $boxName', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

class HiveBoxes {
  static const user = "@USER";
  static const auth = "@AUTH";
  static const role = "@ROLE";
  static const status = "@STATUS";
  static const userData = "@USERDATA";
}