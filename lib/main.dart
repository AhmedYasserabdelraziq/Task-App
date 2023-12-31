import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_test/core/utils/colors.dart';
import 'package:task_test/screens/home_screen/view/home_screen.dart';
import 'package:task_test/screens/home_screen/view_model/home_screen_viewmodel.dart';
import 'package:task_test/services/services_locator.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: locator<HomeScreenViewModel>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: AppColors.whiteColor,
          ),
          useMaterial3: true,
          brightness: Brightness.light,
          cardTheme: const CardTheme(
            color: Colors.white,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
