import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectoble_configue.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> injectobleConfigue() async {
  await getIt.init(environment: Environment.prod);
}
