import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  final String boxName;

  Box<T>? _box;

  HiveService({required this.boxName});

  /// Initializes Hive & opens the box

  Future<void> initialize() async {
    try {
      if (!Hive.isBoxOpen(boxName)) {
        _box = await Hive.openBox<T>(boxName);
      }
    } catch (e) {
      log('Error initializing box "$boxName": $e');
      throw Exception('Error initializing box "$boxName": $e');
    }
  }

  /// Ensures the box is open before performing actions

  Future<void> _ensureBoxOpen() async {
    if (_box == null || !Hive.isBoxOpen(boxName)) {
      _box = await Hive.openBox<T>(boxName);
    }
  }

  /// Adds a new item

  Future<void> addItem(T item) async {
    try {
      await _ensureBoxOpen();

      await _box?.add(item);

      log('Item added to "$boxName".');
    } catch (e) {
      log('Error adding item to "$boxName": $e');
      throw Exception('Error adding item to "$boxName": $e');
    }
  }

  /// Retrieves all items

  Future<List<T>> getAllItems() async {
    await _ensureBoxOpen();

    return _box?.values.toList() ?? [];
  }

  /// Retrieves a single item by index

  Future<T?> getItem(int index) async {
    await _ensureBoxOpen();

    return _box?.getAt(index);
  }

  /// Updates an item at a given index

  Future<void> updateItem(int index, T updatedItem) async {
    await _ensureBoxOpen();

    if (_box!.containsKey(index)) {
      await _box?.putAt(index, updatedItem);
      log('Item updated in "$boxName" at index $index.');
    }
  }

  /// Deletes an item at a given index

  Future<void> deleteItem(int index) async {
    await _ensureBoxOpen();

    if (_box!.containsKey(index)) {
      await _box?.deleteAt(index);
      log('Item deleted from "$boxName" at index $index.');
    }
  }

  /// Clears all items in the box

  Future<void> clearAllItems() async {
    await _ensureBoxOpen();

    await _box?.clear();

    log('All items cleared from "$boxName".');
  }

  /// Closes the Hive box

  Future<void> closeBox() async {
    await _box?.close();

    log('Box "$boxName" closed.');
  }
}
