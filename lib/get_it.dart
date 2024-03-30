import 'package:get_it/get_it.dart';
import 'package:udhaar_kab_dega/repositories/auth_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthRepo>(AuthRepo());
}
