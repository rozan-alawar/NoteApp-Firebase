import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPService {
  final ProviderRef ref;

  SPService(this.ref);

  void write(String key, String value) async {
    await ref.watch(sharedPrefProvider).setString(key, value);
  }

  Future<String> read(String key) async {
    // ignore: await_only_futures
    String data = ref.watch(sharedPrefProvider).getString(key) ?? '';
    return data;
  }

  void clearData() async {
    await ref.watch(sharedPrefProvider).clear();
  }
}

final sharedPrefProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final spServiceProvider = Provider((ref) => SPService(ref));
