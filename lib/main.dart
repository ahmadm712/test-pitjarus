import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitjarus_test/services/location_services.dart';
import 'package:pitjarus_test/ui/cubit/cubit/auth_cubit.dart';
import 'package:pitjarus_test/ui/cubit/list_store_cubit/list_store_cubit.dart';
import 'package:pitjarus_test/ui/cubit/location_cubit/location_home_cubit.dart';
import 'package:pitjarus_test/ui/pages/login_page.dart';
import 'package:pitjarus_test/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final LocationServices locationServices = LocationServices();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ListStoreCubit(),
        ),
        BlocProvider(
          create: (context) => LocationHomeCubit(locationServices),
        ),
      ],
      child: MaterialApp(
        title: 'Test Pitjarus',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Colors.blueGrey),
        ),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: mainRoutes,
      ),
    );
  }
}
