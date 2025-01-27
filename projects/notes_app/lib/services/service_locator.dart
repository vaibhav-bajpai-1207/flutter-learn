import 'package:get_it/get_it.dart';
import 'package:notes_app/pages/notes_list_page/notes_list_manager.dart';
import 'package:notes_app/services/storage_service/shared_preferences_storage.dart';
import 'package:notes_app/services/storage_service/storage_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<NotesListManager>(() => NotesListManager());
  getIt.registerLazySingleton<StorageService>(() => SharedPreferencesStorage());
}
