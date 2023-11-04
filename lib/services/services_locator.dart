import 'package:get_it/get_it.dart';
import 'package:task_test/screens/home_screen/view_model/home_screen_viewmodel.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => HomeScreenViewModel());
}
