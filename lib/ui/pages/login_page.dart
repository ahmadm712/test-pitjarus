import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitjarus_test/services/api_services.dart';
import 'package:pitjarus_test/ui/cubit/cubit/auth_cubit.dart';
import 'package:pitjarus_test/ui/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    context.read<AuthCubit>().login();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
                if (state is AuthSuccess) ...[
                  Text(state.storeListResponse.status!),
                ] else ...[
                  Text(state.toString()),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
