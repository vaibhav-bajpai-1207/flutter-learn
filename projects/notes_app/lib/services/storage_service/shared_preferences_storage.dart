import 'package:notes_app/services/storage_service/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements StorageService {
  static const _notesListKey = 'notesListKey';

  @override
  Future<void> saveNotes(String notesJson) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_notesListKey, notesJson);
  }

  @override
  Future<String?> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_notesListKey);
  }
}
