import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

//There is also a shortcut (if you don't like it just ignore it):
GetIt getIt = GetIt.I;

@injectableInit
GetIt configureInjection() => $initGetIt(getIt);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
